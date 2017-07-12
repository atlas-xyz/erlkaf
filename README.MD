# erlkaf

*Erlang kafka driver based on [librdkafka][1]*
      
### Implementation notes

This project is under development and the interface might change.

The library is implemented in top of `librdkafka` which is a C library implementation of the Apache Kafka protocol 
designed with message delivery reliability and high performance in mind, current figures exceed 1 million msgs/second 
for the producer and 3 million msgs/second for the consumer. 

##### How erlkaf affects the Erlang schedulers

It's well known that NIF's can affect the Erlang schedulers performances in case the functions are not returning in less
than 1-2 ms and blocks the scheduler threads.

Because the `librdkafka` driver is async, erlkaf won't block the scheduler threads and all calls to the native functions 
will return immediately. The `librdkafka` driver use it's own thread pool for managing the requests. Also each client 
has it's own thread from where is sending async the events (delivery reports, logs, statistics) to erlang 
using `enif_send`.
   
### TODO

- Add consumer support
- Add statistics support   
- Add benchmarks
- Add unit tests
- Document all configs

### User guide

Add `erlkaf` as a rebar dependency to your project:

```
{deps, [
  {erlkaf, ".*", {git, "https://github.com/silviucpp/erlkaf.git", "master"}},
}.
```

##### Producer example:

The following example will create a producer client with id `client1` which sends also delivery reports to the same module.
 
In order to receive the delivery reports you need to implement the `erlkaf_producer` protocol or to setup a function with
arity 3 into `delivery_report_callback` (`{delivery_report_callback, fun(MsgRef, DeliveryStatus, Message) -> .. end}`).

The function specified into delivery report callback is called async from another process (each producer has it's own process
from where it's dispatching the delivery reports)

Also in order to send messages to a topic you need to define a topic object attached to the client. To do this you can use the 
`erlkaf:create_topic` method. You can create different versions of the same kafka topic by specifying an id (in the above example
if you send the messages over `<<"benchmark">>` topic will send them without compression but if you send over `topic_id1` will send them
using `lz4` - even if both objects refer to the same kafka topic).
    
```erlang
-module(test).

-export([
    delivery_report/3,
    create_producer/0,
    create_topics/0,
    produce/2
]).

-behavior(erlkaf_producer).

delivery_report(MsgRef, DeliveryStatus, Message) ->
    io:format("received delivery report: ~p ~n", [{MsgRef, DeliveryStatus, Message}]),
    ok.

create_producer() ->
    ProducerConfig = [
        {bootstrap_servers, "broker1:9092,broker2:9092"},
        {delivery_report_only_error, false},
        {delivery_report_callback, ?MODULE}
    ],
    ok = erlkaf:create_producer(client1, ProducerConfig).

create_topics() ->
    TopicOpts = [{request_required_acks, 1}],
    TopicName = <<"benchmark">>,

    ok = erlkaf:create_topic(client1, TopicName, TopicOpts),
    ok = erlkaf:create_topic(client1, topic_id1, TopicName, [{compression_codec, lz4} | TopicOpts]).

produce(Key, Value) ->
    {ok, _} = erlkaf:produce(client1, <<"benchmark">>, Key, Value),
    {ok, _} = erlkaf:produce(client1, topic_id1, Key, Value).
``` 

You can call those like:

```erlang
ok = erlkaf:start().
ok = test:create_producer().
ok = test:create_topics().
test:produce(<<"key1">>, <<"val1">>).
```

And you will get into the console the delivery reports:
 
```erlang   
received delivery report: {#Ref<0.0.8.243>,ok, {erlkaf_msg,<<"benchmark">>,4,6172,<<"key1">>,<<"val1">>}} 
received delivery report: {#Ref<0.0.8.244>,ok, {erlkaf_msg,<<"benchmark">>,4,6173,<<"key1">>,<<"val1">>}}
```    

In case you are not interested in the delivery reports don't specify any callback, or in case you want to receive the 
delivery reports only in case of errors you have to specify a callback and set `delivery_report_only_error` on `true`.

##### Start clients at startup

You may include client configs in `sys.config` have them started by default (by application controller)

Example of configuration (for `sys.config`):

```erlang
{erlkaf, [
    {clients, [
        {client1, [
        
            {type, producer},

            {topics, [
                {<<"benchmark">>, [{request_required_acks, 1}]}
            ]},

            {client_options, [
                {bootstrap_servers, "broker1.com:9092,broker2.com:9092"}
            ]}
        ]}
    ]}
]}
```

[1]:https://github.com/edenhill/librdkafka
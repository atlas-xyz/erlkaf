%logs

-define(PRINT_MSG(Format, Args),
    io:format(Format, Args)).

-define(DEBUG_MSG(Format, Args),
    lager:debug(Format, Args)).

-define(INFO_MSG(Format, Args),
    lager:info(Format, Args)).

-define(WARNING_MSG(Format, Args),
    lager:warning(Format, Args)).

-define(ERROR_MSG(Format, Args),
    lager:error(Format, Args)).

-define(CRITICAL_MSG(Format, Args),
    lager:critical(Format, Args)).

%erlkaf errors

-define(ERR_UNDEFINED_CLIENT, <<"undefined client">>).
-define(ERR_UNDEFINED_CLIENT_PARTITION, <<"undefined client or partition">>).
-define(ERR_ALREADY_EXISTING_TOPIC, <<"already existing topic">>).
-define(ERR_ALREADY_EXISTING_CLIENT, <<"already existing client">>).

% librdkafka internal errors

-define(RD_KAFKA_RESP_ERR_BEGIN, -200).
-define(RD_KAFKA_RESP_ERR_BAD_MSG, -199).
-define(RD_KAFKA_RESP_ERR_BAD_COMPRESSION, -198).
-define(RD_KAFKA_RESP_ERR_DESTROY, -197).
-define(RD_KAFKA_RESP_ERR_FAIL, -196).
-define(RD_KAFKA_RESP_ERR_TRANSPORT, -195).
-define(RD_KAFKA_RESP_ERR_CRIT_SYS_RESOURCE, -194).
-define(RD_KAFKA_RESP_ERR_RESOLVE, -193).
-define(RD_KAFKA_RESP_ERR_MSG_TIMED_OUT, -192).
-define(RD_KAFKA_RESP_ERR_PARTITION_EOF, -191).
-define(RD_KAFKA_RESP_ERR_UNKNOWN_PARTITION, -190).
-define(RD_KAFKA_RESP_ERR_FS, -189).
-define(RD_KAFKA_RESP_ERR_UNKNOWN_TOPIC, -188).
-define(RD_KAFKA_RESP_ERR_ALL_BROKERS_DOWN, -187).
-define(RD_KAFKA_RESP_ERR_INVALID_ARG, -186).
-define(RD_KAFKA_RESP_ERR_TIMED_OUT, -185).
-define(RD_KAFKA_RESP_ERR_QUEUE_FULL, -184).
-define(RD_KAFKA_RESP_ERR_ISR_INSUFF, -183).
-define(RD_KAFKA_RESP_ERR_NODE_UPDATE, -182).
-define(RD_KAFKA_RESP_ERR_SSL, -181).
-define(RD_KAFKA_RESP_ERR_WAIT_COORD, -180).
-define(RD_KAFKA_RESP_ERR_UNKNOWN_GROUP, -179).
-define(RD_KAFKA_RESP_ERR_IN_PROGRESS, -178).
-define(RD_KAFKA_RESP_ERR_PREV_IN_PROGRESS, -177).
-define(RD_KAFKA_RESP_ERR_EXISTING_SUBSCRIPTION, -176).
-define(RD_KAFKA_RESP_ERR_ASSIGN_PARTITIONS, -175).
-define(RD_KAFKA_RESP_ERR_REVOKE_PARTITIONS, -174).
-define(RD_KAFKA_RESP_ERR_CONFLICT, -173).
-define(RD_KAFKA_RESP_ERR_STATE, -172).
-define(RD_KAFKA_RESP_ERR_UNKNOWN_PROTOCOL, -171).
-define(RD_KAFKA_RESP_ERR_NOT_IMPLEMENTED, -170).
-define(RD_KAFKA_RESP_ERR_AUTHENTICATION, -169).
-define(RD_KAFKA_RESP_ERR_NO_OFFSET, -168).
-define(RD_KAFKA_RESP_ERR_OUTDATED, -167).
-define(RD_KAFKA_RESP_ERR_TIMED_OUT_QUEUE, -166).
-define(RD_KAFKA_RESP_ERR_UNSUPPORTED_FEATURE, -165).
-define(RD_KAFKA_RESP_ERR_WAIT_CACHE, -164).
-define(RD_KAFKA_RESP_ERR_INTR, -163).
-define(RD_KAFKA_RESP_ERR_KEY_SERIALIZATION, -162).
-define(RD_KAFKA_RESP_ERR_VALUE_SERIALIZATION, -161).
-define(RD_KAFKA_RESP_ERR_KEY_DESERIALIZATION, -160).
-define(RD_KAFKA_RESP_ERR_VALUE_DESERIALIZATION, -159).
-define(RD_KAFKA_RESP_ERR_END, -100).

%broker errors

-define(RD_KAFKA_RESP_ERR_UNKNOWN, -1).
-define(RD_KAFKA_RESP_ERR_NO_ERROR, 0).
-define(RD_KAFKA_RESP_ERR_OFFSET_OUT_OF_RANGE, 1).
-define(RD_KAFKA_RESP_ERR_INVALID_MSG, 2).
-define(RD_KAFKA_RESP_ERR_UNKNOWN_TOPIC_OR_PART, 3).
-define(RD_KAFKA_RESP_ERR_INVALID_MSG_SIZE, 4).
-define(RD_KAFKA_RESP_ERR_LEADER_NOT_AVAILABLE, 5).
-define(RD_KAFKA_RESP_ERR_NOT_LEADER_FOR_PARTITION, 6).
-define(RD_KAFKA_RESP_ERR_REQUEST_TIMED_OUT, 7).
-define(RD_KAFKA_RESP_ERR_BROKER_NOT_AVAILABLE, 8).
-define(RD_KAFKA_RESP_ERR_REPLICA_NOT_AVAILABLE, 9).
-define(RD_KAFKA_RESP_ERR_MSG_SIZE_TOO_LARGE, 10).
-define(RD_KAFKA_RESP_ERR_STALE_CTRL_EPOCH, 11).
-define(RD_KAFKA_RESP_ERR_OFFSET_METADATA_TOO_LARGE, 12).
-define(RD_KAFKA_RESP_ERR_NETWORK_EXCEPTION, 13).
-define(RD_KAFKA_RESP_ERR_GROUP_LOAD_IN_PROGRESS, 14).
-define(RD_KAFKA_RESP_ERR_GROUP_COORDINATOR_NOT_AVAILABLE, 15).
-define(RD_KAFKA_RESP_ERR_NOT_COORDINATOR_FOR_GROUP, 16).
-define(RD_KAFKA_RESP_ERR_TOPIC_EXCEPTION, 17).
-define(RD_KAFKA_RESP_ERR_RECORD_LIST_TOO_LARGE, 18).
-define(RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS, 19).
-define(RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS_AFTER_APPEND, 20).
-define(RD_KAFKA_RESP_ERR_INVALID_REQUIRED_ACKS, 21).
-define(RD_KAFKA_RESP_ERR_ILLEGAL_GENERATION, 22).
-define(RD_KAFKA_RESP_ERR_INCONSISTENT_GROUP_PROTOCOL, 23).
-define(RD_KAFKA_RESP_ERR_INVALID_GROUP_ID, 24).
-define(RD_KAFKA_RESP_ERR_UNKNOWN_MEMBER_ID, 25).
-define(RD_KAFKA_RESP_ERR_INVALID_SESSION_TIMEOUT, 26).
-define(RD_KAFKA_RESP_ERR_REBALANCE_IN_PROGRESS, 27).
-define(RD_KAFKA_RESP_ERR_INVALID_COMMIT_OFFSET_SIZE, 28).
-define(RD_KAFKA_RESP_ERR_TOPIC_AUTHORIZATION_FAILED, 29).
-define(RD_KAFKA_RESP_ERR_GROUP_AUTHORIZATION_FAILED, 30).
-define(RD_KAFKA_RESP_ERR_CLUSTER_AUTHORIZATION_FAILED, 31).
-define(RD_KAFKA_RESP_ERR_INVALID_TIMESTAMP, 32).
-define(RD_KAFKA_RESP_ERR_UNSUPPORTED_SASL_MECHANISM, 33).
-define(RD_KAFKA_RESP_ERR_ILLEGAL_SASL_STATE, 34).
-define(RD_KAFKA_RESP_ERR_UNSUPPORTED_VERSION, 35).
-define(RD_KAFKA_RESP_ERR_TOPIC_ALREADY_EXISTS, 36).
-define(RD_KAFKA_RESP_ERR_INVALID_PARTITIONS, 37).
-define(RD_KAFKA_RESP_ERR_INVALID_REPLICATION_FACTOR, 38).
-define(RD_KAFKA_RESP_ERR_INVALID_REPLICA_ASSIGNMENT, 39).
-define(RD_KAFKA_RESP_ERR_INVALID_CONFIG, 40).
-define(RD_KAFKA_RESP_ERR_NOT_CONTROLLER, 41).
-define(RD_KAFKA_RESP_ERR_INVALID_REQUEST, 42).
-define(RD_KAFKA_RESP_ERR_UNSUPPORTED_FOR_MESSAGE_FORMAT, 43).
-define(RD_KAFKA_RESP_ERR_POLICY_VIOLATION, 44).
-define(RD_KAFKA_RESP_ERR_OUT_OF_ORDER_SEQUENCE_NUMBER, 45).
-define(RD_KAFKA_RESP_ERR_DUPLICATE_SEQUENCE_NUMBER, 46).
-define(RD_KAFKA_RESP_ERR_INVALID_PRODUCER_EPOCH, 47).
-define(RD_KAFKA_RESP_ERR_INVALID_TXN_STATE, 48).
-define(RD_KAFKA_RESP_ERR_INVALID_PRODUCER_ID_MAPPING, 49).
-define(RD_KAFKA_RESP_ERR_INVALID_TRANSACTION_TIMEOUT, 50).
-define(RD_KAFKA_RESP_ERR_CONCURRENT_TRANSACTIONS, 51).
-define(RD_KAFKA_RESP_ERR_TRANSACTION_COORDINATOR_FENCED, 52).
-define(RD_KAFKA_RESP_ERR_TRANSACTIONAL_ID_AUTHORIZATION_FAILED, 53).
-define(RD_KAFKA_RESP_ERR_SECURITY_DISABLED, 54).
-define(RD_KAFKA_RESP_ERR_OPERATION_NOT_ATTEMPTED, 55).
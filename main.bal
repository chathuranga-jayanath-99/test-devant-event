import ballerina/log;
import ballerinax/rabbitmq;

listener rabbitmq:Listener eventListener = new (host = host, port = 15672);

service "Orders" on eventListener {
    remote function onMessage(rabbitmq:AnydataMessage message, rabbitmq:Caller caller) returns error? {
        do {
            log:printInfo(message.toString());
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

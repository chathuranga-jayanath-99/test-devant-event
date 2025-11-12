import ballerina/log;
import ballerinax/rabbitmq;

listener rabbitmq:Listener eventListener = new (host = host, port = port, password = password, username = username, virtualHost = username);
// listener rabbitmq:Listener eventListener = new (host = host, port = port, connectionData = {username:username, password:password, virtualHost:username});

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

package function;

import org.apache.geode.cache.Declarable;
import org.apache.geode.cache.execute.Function;
import org.apache.geode.cache.execute.FunctionContext;
import org.apache.geode.cache.execute.ResultSender;

import java.util.Properties;

/**
 * Created by zhansen on 7/6/17.
 */
public class TestFunction implements Function, Declarable {

    public void init(Properties props) {

    }

    public boolean hasResult() {
        return true;
    }

    public void execute(FunctionContext context) {
        ResultSender resultSender = context.getResultSender();
        resultSender.lastResult("Test");
    }

    public String getId() {
        return TestFunction.class.getSimpleName();
    }

    public boolean optimizeForWrite() {
        return false;
    }

    public boolean isHA() {
        return false;
    }
}

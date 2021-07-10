package farmacia.providers.active_principle;

import com.intuit.karate.junit5.Karate;

public class Active_principleRunner {
    @Karate.Test
    Karate testActivePrinciple() {
        return new Karate().feature("active_principle").relativeTo(getClass());
    }

}

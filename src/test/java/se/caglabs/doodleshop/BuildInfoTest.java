/*
 * Created by Daniel Marell 14-06-03 17:00
 */
package se.caglabs.doodleshop;

import org.junit.Test;
import se.caglabs.doodleshop.util.BuildInfo;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.core.Is.is;

/**
 * Unit test.
 */
public class BuildInfoTest {
    @Test
    public void checkAppVersionIsPomVersion() throws Exception {
        assertThat(BuildInfo.getAppVersion(), is(notNullValue()));
    }
}

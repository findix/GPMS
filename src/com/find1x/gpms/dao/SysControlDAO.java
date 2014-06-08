package com.find1x.gpms.dao;

import com.find1x.gpms.pojos.SysControl;
import com.find1x.gpms.util.MongoDBUtil;

public class SysControlDAO {
	public static SysControl GetSysControl() {
		SysControl sysControl = MongoDBUtil.getDatastore()
				.find(SysControl.class).get();
		if (sysControl == null) {
			saveSysControl(new SysControl());
		}
		return sysControl;
	}

	public static void saveSysControl(SysControl sysControl) {
		MongoDBUtil.getDatastore().save(sysControl);
	}

}

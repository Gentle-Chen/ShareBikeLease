var _LOCALEMSG = {
		
		KeyNotFound : '无法获取对应的消息值',
		
		BaseMsg: {
			"input_error" : '必填项目为空或输入格式有误。',
			"logout" : '是否确认退出登录？'
		},
		getBaseMsg:function(errorCode) {
			return this.BaseMsg[errorCode] || this.KeyNotFound+'('+errorCode+')';
		},
		
		LoginMsg: {
			"10003" : '用户名或密码错误，请重新输入。',
			"10006" : '用户名或密码错误，请重新输入。',
			"10004" : '密码错误次数达到最大值。',
			"10005" : '用户状态已锁定，请联系管理员解锁。',
			"10014" : '您无权限登录。',
			"10018" : '您未下载令牌，无法登录。',
			"10023" : '动态密码错误，请重新输入。',
		},
		getLoginMsg:function(errorCode) {
			return this.LoginMsg[errorCode] || this.KeyNotFound+'('+errorCode+')';
		},
		UserMsg: {
			"10000" : '操作成功。',
			"00001" : '操作失败。',
			"10002" : '用户数据输入有误，请重新输入。',
			"10017" : '用户已存在，请确认信息是否正确。',
			"10008" : '邮箱已注册，请确认信息是否正确。'
				
		},
		getUserMsg:function(errorCode) {
			return this.UserMsg[errorCode] || this.KeyNotFound+'('+errorCode+')';
		},
		ReSetPwdMsg : {
			"10000" : '修改密码成功。',
			"10003" : '原密码错误，请重新输入。',
			"10019" : '密码长度有误，请重新输入。',
			"10020" : '密码不符合规则，必须是6-20位的数字和字母组合。',
			"10021" : '不能设置以前使用过的密码，请重新输入。',
			"10022" : '新密码不能与旧密码一致，请重新输入。',
			'differ' : '新密码不一致，请重新输入。'
		},
		getReSetPwdMsg:function(errorCode) {
			return this.ReSetPwdMsg[errorCode] || this.KeyNotFound+'('+errorCode+')';
		},
		ScanMsg: {
			"10000" : '操作成功。',
			"00001" : '操作失败。',
			"10002" : '用户数据输入有误，请重新输入。',
			"10017" : '用户已存在，请确认信息是否正确。',
			"10008" : '邮箱已注册，请确认信息是否正确。',
			"status_0" : '待支付',
			"status_1" : '待检测',
			"status_2" : '检测中',
			"status_3" : '审核中',
			"status_4" : '审核通过',
			"status_5" : '审核拒绝'
				
		},
		getScanMsg:function(errorCode) {
			return this.ScanMsg[errorCode] || this.KeyNotFound+'('+errorCode+')';
		},
};
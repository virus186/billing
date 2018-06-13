package com.billing.service;

import com.billing.model.Login;
import com.billing.model.User;

public interface UserService {
	User register(User user);

	User validateUser(Login login);
}

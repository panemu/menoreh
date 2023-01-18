// ignore_for_file: constant_identifier_names

//! API Path
const String LOGIN = 'auth/login';
const String LOGOUT = 'auth/logout';

//! Hive BOX
const String BOX_LOGIN = 'box_login';

//! Hive KEY
const String BOX_KEY_LOGIN = 'box_key_login';

//! Failure Messages
const String FAILURE_UNKNOWN = 'Something went wrong';
const String FAILURE_NOT_FOUND = 'Data is Empty';

//! Exception Messages
const String EXCEPTION_CANCEL = 'Request to API server was cancelled';
const String EXCEPTION_CONNECTION_RTO = 'Connection timeout with API server';
const String EXCEPTION_RECEIVE_RTO = 'Receive timeout in connection with API server';
const String EXCEPTION_SEND_RTO = 'Send timeout in connection with API server';
const String EXCEPTION_OTHER = 'Connection to API server failed due to internet connection';
const String EXCEPTION_UNKNOWN = 'Connection to API server failed due to internet connection';
const String EXCEPTION_BAD_REQ = 'Bad request ';
const String EXCEPTION_NOT_FOUND = 'Not Found';
const String EXCEPTION_ISE = 'Internal server error';
const String EXCEPTION_WRONG = 'Something went wrong';

const String EXCEPTION_LOGIN = 'Please login back';
const String EXCEPTION_LOGIN_INVALID = 'Invalid username or password';
const String EXCEPTION_LOGIN_ERROR = 'Error while getting contacts ';

//! Network Info
const String MESSAGE_UNCONNECTED= 'No Internet';
const String MESSAGE__CONNECTED = 'Connect to Internet';
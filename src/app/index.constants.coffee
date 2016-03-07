angular.module('cookbookFrontend')
  .constant 'malarkey', malarkey
  .constant 'moment', moment
  .constant 'AUTH_EVENTS',
    loginSuccess: 'auth-login-success',
    loginFailed: 'auth-login-failed',
    logoutSuccess: 'auth-logout-success',
    sessionTimeout: 'auth-session-timeout',
    notAuthenticated: 'auth-not-authenticated',
    notAuthorized: 'auth-not-authorized'
  .constant 'REG_EVENTS',
    regSuccess: 'registration-success'
  .constant "baseURL", "http://localhost:3000/api"

const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('./helpers');

passport.use('local.signin', new LocalStrategy({
  usernameField: 'login',
  passwordField: 'pswd',
  passReqToCallback: true
}, async (req, login, pswd, done) => {
  const rows = await pool.query('SELECT * FROM sec_users WHERE login = ?', [login]);
  if (rows.length > 0) {
    const user = rows[0];
    const validPassword = await helpers.matchPassword(pswd, user.pswd)
    if (validPassword) {
      done(null, user, req.flash('success', 'Welcome ' + user.login));
    } else {
      done(null, false, req.flash('message', 'Incorrect Password'));
    }
  } else {
    return done(null, false, req.flash('message', 'The Username does not exists.'));
  }
}));

passport.use('local.signup', new LocalStrategy({
  usernameField: 'login',
  passwordField: 'pswd',
  passReqToCallback: true
}, async (req, login, pswd, done) => {

  const { name, empresa, email } = req.body;
  let newUser = {
    name,
    login,
    pswd,
    email,
    empresa
  };
  newUser.pswd = await helpers.encryptPassword(pswd);
  // Saving in the Database
  const result = await pool.query('INSERT INTO sec_users SET ? ', newUser);
  newUser.sec_users_id = result.insertId;
  return done(null, newUser);
}));

/* passport.use('local.password', new LocalStrategy({
  usernameField: 'login',
  passwordField: 'pswd',
  passReqToCallback: true
}, async (req, login, pswd, done) => {

  const {name} = req.body;
  const pass={pswd};
  pass.pswd = await helpers.encryptPassword(pswd);
  // Saving in the Database
  const result = await pool.query('UPDATE sec_users set ? WHERE login = "?" and name = "?" ', [pass, login, name]);
  pass.sec_users_id = result.insertId;
  return done(null, pass);
})); */


passport.serializeUser((user, done) => {
  done(null, user.sec_users_id);
});

passport.deserializeUser(async (sec_users_id, done) => {
  const rows = await pool.query('SELECT * FROM sec_users WHERE sec_users_id = ?', [sec_users_id]);
  done(null, rows[0]);
});


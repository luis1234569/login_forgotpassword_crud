const express = require('express');
const router = express.Router();

const pool = require('../database');
const helpers = require('../lib/helpers');

const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');

// SIGNUP
router.get('/signup', (req, res) => {
  res.render('auth/signup');
});

router.post('/signup', passport.authenticate('local.signup', {
  successRedirect: '/links',
  failureRedirect: '/signup',
  failureFlash: true
}));

// SINGIN
router.get('/signin', (req, res) => {
  res.render('auth/signin');
});

router.post('/signin', (req, res, next) => {
  req.check('login', 'Username is Required').notEmpty();
  req.check('pswd', 'Password is Required').notEmpty();
  const errors = req.validationErrors();
  if (errors.length > 0) {
    req.flash('message', errors[0].msg);
    res.redirect('/signin');
  }
  passport.authenticate('local.signin', {
    successRedirect: '/links',
    failureRedirect: '/signin',
    failureFlash: true
  })(req, res, next);
});

router.get('/logout', (req, res) => {
  req.logOut();
  res.redirect('/');
});

router.get('/profile', isLoggedIn, (req, res) => {
  res.render('profile');
});
//-----------------------------------------------------
router.get('/password', (req, res)=> {
  res.render('auth/password')
});


router.post('/passwordForget', async (req, res) => {
  const { login,name,pswd } = req.body;
  const logins = {login};
  const names = {name};
  const pass={pswd};
  pass.pswd = await helpers.encryptPassword(pswd);
  await pool.query('UPDATE sec_users set ? WHERE ? and ? ', [pass, logins, names]);
  res.redirect('/signin');
});
//-----------------------------------------------------
/* router.post('/forgot-password', passport.authenticate('local.password', {
  successRedirect: '/links',
  failureRedirect: '/signup',
  failureFlash: true
})); */

module.exports = router;

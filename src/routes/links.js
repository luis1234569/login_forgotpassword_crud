const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('links/add');
});

router.post('/add', async (req, res) => {
    const { parent, description, link, node_order, activo, usuario, idusuario, idempresa } = req.body;
    const newMenu = {
        parent,
        description,
        link, 
        node_order,
        activo,
        usuario,
        idusuario,
        idempresa
    };
    await pool.query('INSERT INTO menu set ?', [newMenu]);
    req.flash('success', 'Menu Saved Successfully');
    res.redirect('/links');
});

router.get('/', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM menu');
    res.render('links/list', { links });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM menu WHERE ID = ?', [id]);
    req.flash('success', 'Menu Removed Successfully');
    res.redirect('/links');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const links = await pool.query('SELECT * FROM menu WHERE id = ?', [id]);
    console.log(links);
    res.render('links/edit', {link: links[0]});
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { parent, description, link, node_order, activo, usuario, idempresa} = req.body; 
    const newMenu = {
        parent,
        description,
        link,
        node_order,
        activo,
        usuario,
        idempresa
    };
    await pool.query('UPDATE menu set ? WHERE id = ?', [newMenu, id]);
    req.flash('success', 'Menu Updated Successfully');
    res.redirect('/links');
});

module.exports = router;
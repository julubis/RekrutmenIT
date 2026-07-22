const express = require('express');
const mysql = require('mysql2/promise');

const app = express();

let connection;

(async () => {
    connection = await mysql.createConnection({
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: '',
        database: 'rekrutmen'
    });
})();

// connection.query("SELECT * FROM pasien WHERE id = 2", (error, result, fileds) => {
//     result.forEach(element => {
//         console.log(element.id);
//     });
// });
// connection.end();

app.get('/api/riwayat-pendaftaran', async (req, res) => {
    if (!connection) return res.statusCode(500);
    const { nrm, date_from, date_to } = req.query
    if (!nrm) {
        return res.json({
            status: false,
            message: 'Nomor Rekam Medis Wajib Diisi',
            data: null
        })
    }
    try {
        let query = `SELECT 
            id, nama, tgl_lahir, jenis_kelamin, alamat 
            FROM pasien WHERE id = ? `;
        
        if (!date_from) {
            query = `SELECT 
            id, nama, tgl_lahir, jenis_kelamin, alamat 
            FROM pasien WHERE id = ? `;
        }
        const [result, fields] = await connection.execute(query, [nrm]);
        res.json({result});

    } catch (e) {

    }
    const query = "SELECT id, nama, tgl_lahir, jenis_kelamin, alamat FROM pasien WHERE id = :nrm";
    
    if (date_from) {
        // connection.query(query, {nrm}, (errors, result, fields) => {
        //     res.json(result)
        // })
        // connection.query("SELECT * FROM pasien WHERE id = 2", (error, result, fileds) => {
//     result.forEach(element => {
//         console.log(element.id);
//     });
// });
// connection.end();
    }
    // return res.json({nrm});
})

app.listen(3000, async() => {
    console.log('running')
});
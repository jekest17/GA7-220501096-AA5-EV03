<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - CyberShield AI</title>
    <style>
        /* Estilos Generales */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #0d0d2b;
            color: #fff;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 80px;
            background-color: #131336;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            gap: 20px;
            position: relative; /* Importante para el posicionamiento del tooltip */
        }

        .sidebar a {
            color: #fff;
            text-decoration: none;
            font-size: 24px;
            margin-bottom: 20px;
            position: relative;
        }

        .sidebar a:hover {
            color: #bb86fc;
        }

        .sidebar a::after {
            content: attr(title); /* Utiliza el atributo title para mostrar el tooltip */
            position: absolute;
            top: 50%;
            left: 100%;
            transform: translateY(-50%);
            background-color: #131336;
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            white-space: nowrap;
            display: none;
            z-index: 100; /* Asegura que el tooltip aparezca sobre otros elementos */
        }

        .sidebar a:hover::after {
            display: block;
        }

        .content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }

        .header {
            margin-bottom: 20px;
        }

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }

        .card {
            background-color: #1a1a3b;
            border-radius: 10px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            position: relative;
        }

        .card h3 {
            margin-bottom: 10px;
            font-size: 1.2rem;
            color: #bb86fc;
        }

        .card.large {
            grid-column: span 2;
            height: 400px;
        }

        .card p {
            font-size: 2rem;
            color: #fff;
        }

        .card span {
            font-size: 3rem;
            font-weight: bold;
            color: #bb86fc;
        }

        .chart-container {
            width: 100%;
            height: 250px;
            display: flex;
            justify-content: center; /* Centra el gráfico horizontalmente */
            align-items: center; /* Centra el gráfico verticalmente */
        }

        .footer {
            text-align: center;
            padding: 10px 0;
            color: #666;
            font-size: 0.8rem;
        }
    </style>
</head>

<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <a href="bienvenido.jsp" title="Dashboard">🏠</a>
            <a href="detallesAnalisis.jsp" title="Detalles de Análisis">📊</a>
            <a href="configuracion.jsp" title="Configuración">⚙️</a>
        </div>

        <!-- Contenido Principal -->
        <div class="content">
            <!-- Encabezado -->
            <div class="header">
                <h1>Bienvenid@</h1>
                <p>Dashboard</p>
            </div>

            <!-- Cuadrícula de Tarjetas -->
            <div class="cards-grid">
                <!-- Total Amenazas -->
                <div class="card">
                    <h3>Total de Amenazas Detectadas</h3>
                    <span>25</span>
                </div>

                <!-- Cumplimiento Normativo -->
                <div class="card">
                    <h3>Cumplimiento Normativo</h3>
                    <span>85%</span>
                </div>

                <!-- Usuarios Autenticados -->
                <div class="card">
                    <h3>Usuarios Autenticados</h3>
                    <span>150</span>
                </div>

                <!-- Último Escaneo de Seguridad -->
                <div class="card">
                    <h3>Último Escaneo de Seguridad</h3>
                    <p>Hace 1 hora</p>
                </div>

                <!-- Gráfico: Amenazas Detectadas -->
                <div class="card large chart">
                    <h3>Amenazas Detectadas</h3>
                    <div class="chart-container">
                        <canvas id="chartAmenazas"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        Cybershield 2024 - Desarrollado por JESSICA E
    </div>

    <!-- Librería Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctxAmenazas = document.getElementById('chartAmenazas').getContext('2d');
        const chartAmenazas = new Chart(ctxAmenazas, {
            type: 'bar',
            data: {
                labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May'],
                datasets: [{
                    label: 'Amenazas Detectadas',
                    data: [5, 10, 8, 15, 9],
                    backgroundColor: '#bb86fc' // Color consistente con el tema
                }]
            },
            options: { responsive: true }
        });
    </script>
</body>

</html>



<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Reports Export</title>
    <style>
        body { font-family: Arial, sans-serif; font-size: 12px; color: #111; }
        h1, h2 { margin: 0 0 8px 0; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 16px; }
        th, td { border: 1px solid #ddd; padding: 6px 8px; text-align: left; }
        th { background: #f5f5f5; }
        .meta { margin-bottom: 16px; }
    </style>
</head>
<body>
    <h1>Sales Reports</h1>
    <div class="meta">Date Range: {{ $startDate }} to {{ $endDate }}</div>

    <h2>Sales Trend</h2>
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Orders</th>
                <th>Total Sales</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($salesTrend as $row)
                <tr>
                    <td>{{ $row->date }}</td>
                    <td>{{ $row->orders_count }}</td>
                    <td>{{ $row->total_sales }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <h2>Top Products</h2>
    <table>
        <thead>
            <tr>
                <th>Product</th>
                <th>Total Sold</th>
                <th>Total Revenue</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($topProducts as $row)
                <tr>
                    <td>{{ $row->name }}</td>
                    <td>{{ $row->total_sold }}</td>
                    <td>{{ $row->total_revenue }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>

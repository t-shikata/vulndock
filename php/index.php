<?php
// =======================
// Vulnerable SQLi search
// =======================

$host = "db";
$db   = "company";
$user = "root";
$pass = "rootpass";

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$db;charset=utf8mb4",
        $user,
        $pass,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    die("DB connection failed");
}

$keyword = $_GET['q'] ?? '';
$result = [];

if ($keyword !== '') {
    $sql = "
        SELECT name, department, position, extension
        FROM employees
        WHERE name LIKE '%$keyword%'
    ";

    $stmt = $pdo->query($sql);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>社員検索システム</title>
</head>
<body>

<h2>社員検索</h2>

<form method="GET">
    <input type="text" name="q" placeholder="社員名で検索" value="<?= htmlspecialchars($keyword) ?>">
    <button type="submit">検索</button>
</form>

<hr>

<?php if ($result): ?>
<table border="1">
<tr>
    <th>名前</th>
    <th>部署</th>
    <th>役職</th>
    <th>内線</th>
</tr>
<?php foreach ($result as $row): ?>
<tr>
    <td><?= $row['name'] ?></td>
    <td><?= $row['department'] ?></td>
    <td><?= $row['position'] ?></td>
    <td><?= $row['extension'] ?></td>
</tr>
<?php endforeach; ?>
</table>
<?php endif; ?>

</body>
</html>
// Status login pengguna
let isLoggedIn = false;

// Fungsi untuk mengubah status login
function toggleLogin() {
    isLoggedIn = !isLoggedIn;
    updateMenu();
}

// Fungsi untuk memperbarui menu berdasarkan status login
function updateMenu() {
    const loginMenu = document.getElementById('login-menu');
    const logoutMenu = document.getElementById('logout-menu');

    if (isLoggedIn) {
        loginMenu.style.display = 'none';
        logoutMenu.style.display = 'flex';
    } else {
        loginMenu.style.display = 'flex';
        logoutMenu.style.display = 'none';
    }
}

// Memperbarui menu saat halaman dimuat
window.onload = updateMenu;
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Usuario</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </head>
    <body>
        <!-- component -->
        <div
            class="bg-black text-white flex min-h-screen flex-col items-center pt-16 sm:justify-center sm:pt-0"
            >
            <a href="#">
                <div
                    class="text-foreground font-semibold text-2xl tracking-tighter mx-auto flex items-center gap-2"
                    >
                    <div>
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke-width="1.5"
                            stroke="currentColor"
                            class="w-6 h-6"
                            >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M15.042 21.672 13.684 16.6m0 0-2.51 2.225.569-9.47 5.227 7.917-3.286-.672Zm-7.518-.267A8.25 8.25 0 1 1 20.25 10.5M8.288 14.212A5.25 5.25 0 1 1 17.25 10.5"
                            />
                        </svg>
                    </div>
                    Poko Palace
                </div>
            </a>
            <div class="relative mt-12 w-full max-w-lg sm:mt-10">
                <div
                    class="relative -mb-px h-px w-full bg-gradient-to-r from-transparent via-sky-300 to-transparent"
                    bis_skin_checked="1"
                    ></div>
                <div
                    class="mx-5 border dark:border-b-white/50 dark:border-t-white/50 border-b-white/20 sm:border-t-white/20 shadow-[20px_0_20px_20px] shadow-slate-500/10 dark:shadow-white/20 rounded-lg border-white/20 border-l-white/20 border-r-white/20 sm:shadow-sm lg:rounded-xl lg:shadow-none"
                    >
                    <div class="flex flex-col p-6">
                        <h3 class="text-xl font-semibold leading-6 tracking-tighter">
                            Registrarse
                        </h3>
                        <p class="mt-1.5 text-sm font-medium text-white/50">
                            Bienvenido, si eres nuestro cliente, registrate para ver tu
                            historial de compra.
                        </p>
                    </div>
                    <div class="p-6 pt-0">
                        <form action="Carrito_Controlador" method="post">
                            <div>
                                <div>
                                    <div
                                        class="group relative rounded-lg border focus-within:border-sky-200 px-3 pb-1.5 pt-2.5 duration-200 focus-within:ring focus-within:ring-sky-300/30"
                                        >
                                        <div class="flex justify-between">
                                            <label
                                                class="text-xs font-medium text-muted-foreground group-focus-within:text-white text-gray-400"
                                                >Usuario</label
                                            >
                                            <div
                                                class="absolute right-3 translate-y-2 text-green-200"
                                                >
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    viewBox="0 0 24 24"
                                                    fill="currentColor"
                                                    class="w-6 h-6"
                                                    >
                                                <path
                                                    fill-rule="evenodd"
                                                    d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12Zm13.36-1.814a.75.75 0 1 0-1.22-.872l-3.236 4.53L9.53 12.22a.75.75 0 0 0-1.06 1.06l2.25 2.25a.75.75 0 0 0 1.14-.094l3.75-5.25Z"
                                                    clip-rule="evenodd"
                                                    />
                                                </svg>
                                            </div>
                                        </div>
                                        <input
                                            type="text"
                                            name="usuario"
                                            placeholder="Usuario"
                                            autocomplete="off"
                                            class="block w-full border-0 bg-transparent p-0 text-sm file:my-1 file:rounded-full file:border-0 file:bg-accent file:px-4 file:py-2 file:font-medium placeholder:text-muted-foreground/90 focus:outline-none focus:ring-0 sm:leading-7 text-foreground" required
                                            />
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4">
                                <div>
                                    <div
                                        class="group relative rounded-lg border focus-within:border-sky-200 px-3 pb-1.5 pt-2.5 duration-200 focus-within:ring focus-within:ring-sky-300/30"
                                        >
                                        <div class="flex justify-between">
                                            <label
                                                class="text-xs font-medium text-muted-foreground group-focus-within:text-white text-gray-400"
                                                >Email</label
                                            >
                                        </div>
                                        <div class="flex items-center">
                                            <input
                                                type="email"
                                                name="email"
                                                placeholder="Email"
                                                class="block w-full border-0 bg-transparent p-0 text-sm file:my-1 placeholder:text-muted-foreground/90 focus:outline-none focus:ring-0 focus:ring-teal-500 sm:leading-7 text-foreground" required
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4">
                                <div>
                                    <div
                                        class="group relative rounded-lg border focus-within:border-sky-200 px-3 pb-1.5 pt-2.5 duration-200 focus-within:ring focus-within:ring-sky-300/30"
                                        >
                                        <div class="flex justify-between">
                                            <label
                                                class="text-xs font-medium text-muted-foreground group-focus-within:text-white text-gray-400"
                                                >Contraseña</label
                                            >
                                        </div>
                                        <div class="flex items-center">
                                            <input
                                                type="password"
                                                id="contrasena"
                                                name="contrasena"
                                                placeholder="Contrasena"
                                                class="block w-full border-0 bg-transparent p-0 text-sm file:my-1 placeholder:text-muted-foreground/90 focus:outline-none focus:ring-0 focus:ring-teal-500 sm:leading-7 text-foreground" required
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4 flex items-center justify-center gap-x-2">
                                <div class="mt-4 flex items-center justify-end gap-x-2">                                   
                                    <button class="font-semibold hover:bg-black hover:text-white hover:ring hover:ring-white transition duration-300 inline-flex items-center justify-center rounded-md text-sm focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-white text-black h-10 px-4 py-2" type="submit" name="accion" value="registrarUsuario">Registrarse</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <% if (request.getAttribute("registroExitoso") != null) { %>
        <script>
            // Mostrar SweetAlert para registro exitoso
            Swal.fire({
                icon: 'success',
                title: '¡Registro exitoso!',
                html: '¡Haga clic en el botón para iniciar sesión!',
                showConfirmButton: true,
                confirmButtonText: 'Iniciar sesión',
                timer: 1500
            }).then(() => {
                // Redirigir a la página de inicio de sesión después de hacer clic en el botón
                window.location.href = 'iniciarSesion.jsp';
            });
        </script>
        <% } else { %>
        <%-- Mostrar mensaje de correo existente --%>
        <% if (request.getAttribute("correoExistente") != null) { %>
        <script>
            // Mostrar SweetAlert para correo existente
            Swal.fire({
                icon: 'warning',
                title: 'El correo electrónico ya está registrado.',
                showConfirmButton: false,
                timer: 1500
            });
        </script>
        <% } %>

        <%-- Mostrar mensaje de error de registro --%>
        <% if (request.getAttribute("errorRegistro") != null) { %>
        <script>
            // Mostrar SweetAlert para error de registro
            Swal.fire({
                icon: 'error',
                title: 'Error al registrar. Inténtalo de nuevo más tarde.',
                showConfirmButton: false,
                timer: 1500
            });
        </script>
        <% } %>
        <% }%>
    </body>
</html>


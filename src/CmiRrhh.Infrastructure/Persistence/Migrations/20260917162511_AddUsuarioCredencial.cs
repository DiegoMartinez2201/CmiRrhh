using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CmiRrhh.Infrastructure.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class AddUsuarioCredencial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Usuario_Credencial",
                columns: table => new
                {
                    IdUsuario = table.Column<int>(type: "int", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    RequiereCambioPassword = table.Column<bool>(type: "bit", nullable: false),
                    IntentosFallidos = table.Column<int>(type: "int", nullable: false, defaultValue: 0),
                    FechaBloqueo = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Usuario_Credencial", x => x.IdUsuario);
                    table.ForeignKey(
                        name: "FK_Usuario_Credencial_Usuario",
                        column: x => x.IdUsuario,
                        principalTable: "Usuario",
                        principalColumn: "IdUsuario",
                        onDelete: ReferentialAction.Cascade);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Usuario_Credencial");
        }
    }
}

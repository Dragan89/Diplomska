﻿using MojKatalog.Helpers.Enumerations;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Globalization;
using System.Web.Security;

namespace MojKatalog.Models
{
    public class UsersContext : DbContext
    {
        public UsersContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<UserProfile> UserProfiles { get; set; }
    }

    [Table("UserProfile")]
    public class UserProfile
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int UserId { get; set; }
        public string UserName { get; set; }
    }

    public class RegisterExternalLoginModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        public string ExternalLoginData { get; set; }
    }

    public class LocalPasswordModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Стара лозинка")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "Лозинката треба да има минимум {2} карактери.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Нова лозинка")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Потврди нова лозинка")]
        [Compare("NewPassword", ErrorMessage = "Лозинката не се совпаѓа.")]
        public string ConfirmPassword { get; set; }
    }

    public class LoginModel
    {
        [Required]
        [Display(Name = "Корисничко име")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Лозинка")]
        public string Password { get; set; }

        public LogedUserTypeEnum UserType { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterModel
    {
        [Required]
        [Display(Name = "Име")]
        public string Ime { get; set; }

        [Required]
        [Display(Name = "Презиме")]
        public string Prezime { get; set; }

        [Required]
        [Display(Name = "Корисничко име")]
        public string KorisnickoIme { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Лозинка")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Потврди лозинка")]
        [Compare("Password", ErrorMessage = "Лозинката не се совпаѓа.")]
        public string ConfirmPassword { get; set; }

        [Required]
        [Display(Name = "Е-Маил")]
        [EmailAddress(ErrorMessage = "Е-Маил адресата не е валидна")]
        public string Email { get; set; }

        [Display(Name = "Телефон")]
        public string Telefon { get; set; }
    }

    public class RegisterKompanijaModel
    {
        [Display(Name = "Назив")]
        [Required]
        public string Naziv { get; set; }

        [Required]
        [Display(Name = "Корисничко име")]
        public string KorisnickoIme { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Лозинка")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Потврди лозинка")]
        [Compare("Password", ErrorMessage = "Лозинката не се совпаѓа.")]
        public string ConfirmPassword { get; set; }

        [Required]
        [Display(Name = "Е-Маил")]
        [EmailAddress(ErrorMessage = "Е-Маил адресата не е валидна")]
        public string Email { get; set; }

        [Display(Name = "Телефон")]
        public string Telefon { get; set; }
    }

    public class ChangePasswordModel
    {
        public LogedUserTypeEnum UserType { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Корисничко име")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Стара лозинка")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "Лозинката треба да има минимум {2} карактери.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Нова лозинка")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Потврди нова лозинка")]
        [Compare("NewPassword", ErrorMessage = "Лозинката не се совпаѓа.")]
        public string ConfirmPassword { get; set; }
    }

    public class ExternalLogin
    {
        public string Provider { get; set; }
        public string ProviderDisplayName { get; set; }
        public string ProviderUserId { get; set; }
    }
}

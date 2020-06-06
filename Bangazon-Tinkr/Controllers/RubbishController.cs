﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bangazon_Tinkr.DataAccess;
using Bangazon_Tinkr.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace Bangazon_Tinkr.Controllers
{
    [Route("api/Rubbish")]
    [ApiController]
    public class RubbishController : ControllerBase
    {
        RubbishRepo _rubbishRepository;

        public RubbishController(RubbishRepo repository)
        {
            _rubbishRepository = repository;
        }

        // api/Rubbish/2
        [HttpGet("{rubbishId}")]
        public IActionResult GetRubbishById(int rubbishId)
        {
            var singleRubbish = _rubbishRepository.getSingleRubbish(rubbishId);
            if (singleRubbish != null)
            {
                return Ok(singleRubbish);
            }
            else return NotFound("That Rubbish does not exist.");
        }

        // api/Rubbish/
        [HttpGet]
        public IActionResult GetAllRubbish()
        {
            var allRubbish = _rubbishRepository.GetRubbish();
            if (allRubbish == null) return NotFound(" There is not any Rubbish in the inventory");

            return Ok(allRubbish);
        }

        // api/Rubbish/{rubbishId}
        [HttpDelete("{rubbishId}")]
        public IActionResult DeleteRubbishById(int rubbishId)
        {
            var isValidRubbish = _rubbishRepository.getSingleRubbish(rubbishId);
            if (isValidRubbish != null)
            {
                var deletedRubbish = _rubbishRepository.DeleteRubbish(rubbishId);
                return Ok("The rubbish has been successfully deleted.");
            }
            return NotFound("That rubbish does not exist and could not be deleted");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace EchoService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EchoController : ControllerBase
    {
      

        // GET api/values/5
        [HttpGet("{age}")]
        public ActionResult<string> Get(int age)
        {
            if (age <= 12) {
                return "Not a teenager yet.";
            } else if (age > 12 && age < 20) {
                return "Yup, a teenager.";
            } else {
                return "Not a teenager anymore";
            }
        }
    }
}

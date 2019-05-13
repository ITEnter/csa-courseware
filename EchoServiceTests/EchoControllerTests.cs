using System;
using Xunit;
using EchoService.Controllers;

namespace EchoControllerTests
{
    public class TestEchoController
    {
        [Fact]
        public void GET_WhenUnder10_ResponseShouldBeTeenager()
        {
            var controller = new EchoController();
            Assert.Equal("Not a teenager yet.", controller.Get(9).Value);
        }
    }
}

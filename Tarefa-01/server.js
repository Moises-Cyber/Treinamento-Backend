import express, { json, request, response } from "express";

const app = express();

app.use(json());

app.get("/answer", (request, response) => {
    response.send("Gloria ao Sol");
});

app.post("/bhaskara_value", (request, response) => {
    let value1 = request.body.value1;
    let value2 = request.body.value2;
    let value3 = request.body.value3;

    Bhaskara(value1, value2, value3);

    function Bhaskara(a, b, c) {
        let delta = b * b - 4 * a * c;

        if (delta === 0) {
            let root = -(b / (2 * a));
            response.send(`Duas raízes reais iguais a ${root}`);
        }
        if (delta > 0) {
            let root1 = -b + Math.sqrt(delta) / (2 * a);
            let root2 = -b - Math.sqrt(delta) / (2 * a);
            response.send(root1 + " e " + root2);
        }
        if (delta < 0) {
            response.send("Não há raízes reais");
        }
    }
});

app.delete("/which_triangle/:id1/:id2/:id3", (request, response) => {
    let { side1, side2, side3 } = id;
    let a = request.params.id;

    //let side1 = request.params.id1;
    //let side2 = request.params.id2;
    //let side3 = request.params.id3;

    sideTriangle(side1, side2, side3);

    function sideTriangle() {
        if (side1 === side2 && side1 === side3) {
            response.send("Triangulo equilatero");
        }
        if (side1 === side2 || side1 === side3 || side2 === side3) {
            response.send("Triangulo isosceles");
        }
        if (side1 !== side2 && side1 !== side3 && side2 !== side3) {
            response.send("Triangulo escaleno");
        }
    }
});

app.listen(3004, () => {
    console.log("Rodando o backend na porta " + 3004);
});

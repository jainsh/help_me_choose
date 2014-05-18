$ ->
  $("#container").highcharts
    chart:
      type: "bar"

    title:
      text: "Plan Comparison"

    plotOptions:
      bar:
        stacking: "normal"

    xAxis:
      categories: [
        "Aetna PPO / Coinsurance 80%"
        "Aetna PPO / Coinsurance 70%"
        "Aetna 5000 High Deductible w/HSA"
      ]

    yAxis:
      title:
        text: "Cost (in dollars)"

    series: [
      {
        name: "Annual Premium"
        color: "#990000"
        data: [
          1
          0
          4
        ]
      }
      {
        name: "Services / Care"
        color: "#2929A3"
        data: [
          5
          7
          3
        ]
      }
    ]

  return
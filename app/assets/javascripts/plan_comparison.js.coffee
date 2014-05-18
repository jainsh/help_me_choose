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
      tickInterval: 500

    series: [
      {
        name: "Annual Premium"
        color: "#990000"
        data: [
          1000
          500
          2000
        ]
      }
      {
        name: "Services / Care"
        color: "#2929A3"
        data: [
          2500
          4000
          3500
        ]
      }
    ]

  return
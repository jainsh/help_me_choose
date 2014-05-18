$ ->
  $("#container").highcharts
    chart:
      type: "bar"

    title:
      text: "Plan Comparison"

    plotOptions:
      bar:
        stacking: "normal"

    legend:
      reversed: true

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
        name: "Services / Care"
        color: "#94B8FF"
        data: [
          1100
          2200
          3000
        ]
      }
      {
        name: "Annual Premium"
        color: "#BC5959"
        data: [
          4800
          3600
          2400
        ]
      }
    ]

  return
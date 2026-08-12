---
layout: default
title: Environmental
---
Data centers used about 415 terawatt-hours of electricity to run in 2024. That is roughly 1.5% of the world's supply.[^1] The concern is that this number is only increasing. Consumption grew around 12% a year over the previous five years, rose another 17% in 2025, and the International Energy Agency expects it to double by 2030. Facilities built specifically for AI grew 50% in 2025 and are projected to triple by the end of the decade.[^2]

A sector growing 15% a year is a different problem from other large sectors who are not seeing the same growth. Gas plants take about six years to build now, up from four and a half, and transmission lines take even longer.[^3] This means that infrastructure has a hard time keeping up with the demand.

Almost half of this happens in the United States alone, who accounted for 45% of global data center electricity use in 2024, China 25%, Europe 15%.[^4]

A lot of public arguments focus on whether individual chatbot use is doing any damage. Google published production measurements in August 2025 showing that a median Gemini text prompt drew 0.24 watt-hours, about nine seconds of television, along with 0.26 milliliters of water and 0.03 grams of CO2.[^5] Those figures sit far below what gets pushed in popular media, where a single query is sometimes described as costing half a liter of water. Google tried to clear the water so to speak. It also drew the measurement boundary wider than other researchers had, counting idle machines and cooling overhead instead of just the draw on energy that chips have alone. The choice to do that made its published number 2.4x larger than maybe a  narrower method would have. This should be taken seriously, while still wanting a third-party to check it as well.

The individual and aggregate numbers point in different directions, making it hard for people to discuss. The billions of prompts that are input daily show how massive this is. But neither figure tells you much about what actually determines where the infrastructure is built.

What happens when a new facility comes online?

In May 2026, county commissioners in Box Elder County, Utah approved the Stratos Project, a nine-gigawatt data center and generation campus spread across roughly 40,000 acres of Hansel Valley. At full buildout its power draw would exceed twice Utah's entire current electricity consumption. It is expected to bring about 200 permanent jobs and $74.7 million a year in property tax. More than a thousand residents came to the meeting to object.[^6]

The campus pulls a rate of 9 GW at any given time. Utilities across the country reported roughly 700 gigawatts of requested interconnection capacity from data centers in 2025. That number overstates real demand by some unknown margin, since developers file with several utilities for the same project and then pick one. Even heavily discounted it exceeds what the grid can supply on the schedule requested, and the gap is being filled largely with natural gas.[^7]

Water works differently than most people assume. The IEA put total data center water consumption at about 560 billion liters in 2023, of which roughly two-thirds was indirect, meaning water consumed at power plants generating the electricity rather than water running through cooling systems on site.[^8] Direct cooling accounted for around 140 billion liters. This means the question of water and energy are mostly the same question. A facility that switches to a less efficient cooling design has not necessarily reduced its water footprint at all.

The Utah project will need more than 10,000 acre-feet of water, somewhere above twelve billion liters, in a state that has been concerned with the Great Salt Lake's decline for years.[^9] Training GPT-3 in Microsoft's US facilities was estimated to have evaporated around 700,000 liters of clean freshwater.[^10]

The hardware itself is hardly ever discussed. A study in Nature Computational Science projected that generative AI could produce between 1.2 and 5 million tonnes of electronic waste from 2020 to 2030, and found that repair, reuse, and better recycling along the supply chain could cut that by somewhere between 16% and 86%.[^11]

Emissions are where the companies have testified against themselves. Microsoft reported 20 million metric tons of CO2 equivalent in 2025, up from 16 million the year before, a 25% rise attributed to datacenter construction and pausing its use of certain renewable energy certificates that did not add new clean power to any grid.[^12] Google reported an 18% increase. Critics have their work cut out for them here. These companies with public net-zero commitments are publishing numbers that don't live up to said commitments.

Several analyses argue AI could cut global emissions by 4% to 16% by 2030 through better grid management, materials discovery, and logistics, possibly outweighing everything above.[^13] It also assumes deployment toward those uses at a scale that has not happened, and most of the compute being built right now is not going toward grid optimization.

[^1]: https://www.iea.org/reports/energy-and-ai/energy-demand-from-ai

[^2]: https://www.iea.org/news/data-centre-electricity-use-surged-in-2025-even-with-tightening-bottlenecks-driving-a-scramble-for-solutions

[^3]: https://www.ucs.org/about/news/data-center-fact-sheet

[^4]: https://www.iea.org/reports/energy-and-ai/energy-demand-from-ai

[^5]: https://arxiv.org/abs/2508.15734

[^6]: https://www.upr.org/politics/2026-05-06/box-elder-data-center

[^7]: https://www.ucs.org/about/news/data-center-fact-sheet

[^8]: https://www.sciencedirect.com/science/article/pii/S2666389925002788

[^9]: https://www.upr.org/politics/2026-05-06/box-elder-data-center

[^10]: https://www.sciencedirect.com/science/article/pii/S2666389925002788

[^11]: https://www.nature.com/articles/s43588-024-00726-0

[^12]: https://fortune.com/2026/07/09/microsoft-carbon-emissions-2025-data-centers/

[^13]: https://www.nature.com/articles/s44168-025-00252-3

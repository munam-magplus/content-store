# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# Country.create(country_name:"Norway",country_code:"NO" )
# Country.create(country_name:"USA",country_code:"USA" )
# Country.create(country_name:"Nigeria",country_code:"NI" )
# Country.create(country_name:"New Zealand",country_code:"NZ" )
# Country.create(country_name:"Netherlands",country_code:"NET" )
# Country.create(country_name:"Nepal",country_code:"NE" )
# Country.create(country_name:"Namibia",country_code:"NA" )
# Country.create(country_name:"Myanmar",country_code:"MYN" )
# Country.create(country_name:"United Kingdom",country_code:"UK" )
# Country.create(country_name:"Montenegro",country_code:"MT" )
# Country.create(country_name:"Mongolia",country_code:"MO" )
# Country.create(country_name:"Mexico",country_code:"ME" )
# Country.create(country_name:"Mauritius",country_code:"MU" )
# Country.create(country_name:"Malta",country_code:"MA" )
# Country.create(country_name:"Maldives",country_code:"ML" )
# Country.create(country_name:"Malaysia",country_code:"MY" )
# Country.create(country_name:"Luxembourg",country_code:"LU" )
# Country.create(country_name:"Lithuania",country_code:"LI" )
# Country.create(country_name:"Libya",country_code:"LY" )
# Country.create(country_name:"Lebanon",country_code:"LE" )
# Country.create(country_name:"Latvia",country_code:"LT" )
# Country.create(country_name:"Laos",country_code:"LO" )
# Country.create(country_name:"Kuwait",country_code:"KW" )
# Country.create(country_name:"Korea(South)",country_code:"KS" )
# Country.create(country_name:"Korea(North)",country_code:"KN" )
# Country.create(country_name:"Kenya",country_code:"KEN" )
# Country.create(country_name:"Jordan",country_code:"JO" )
# Country.create(country_name:"Japan",country_code:"JA" )
# Country.create(country_name:"Jamaica",country_code:"JM" )
# Country.create(country_name:"Italy",country_code:"IY" )
# Country.create(country_name:"Israel",country_code:"IS" )
# Country.create(country_name:"Ireland",country_code:"IRE" )
# Country.create(country_name:"Iraq",country_code:"IQ" )
# Country.create(country_name:"Iran",country_code:"IR" )
# Country.create(country_name:"Indonesia",country_code:"IND" )
# Country.create(country_name:"India",country_code:"IN" )
# Country.create(country_name:"Iceland",country_code:"IL" )
# Country.create(country_name:"Hungary",country_code:"HU" )
# Country.create(country_name:"Hong Kong",country_code:"HK" )
# Country.create(country_name:"Guatemala",country_code:"GU" )
# Country.create(country_name:"Greece",country_code:"GE" )
# Country.create(country_name:"Ghana",country_code:"GH" )
# Country.create(country_name:"Germany",country_code:"GR" )
# Country.create(country_name:"Georgia",country_code:"GO" )
# Country.create(country_name:"France",country_code:"FR" )
# Country.create(country_name:"Finland",country_code:"FI" )
# Country.create(country_name:"Fiji",country_code:"FJ" )
# Country.create(country_name:"Ethiopia",country_code:"ET" )
# Country.create(country_name:"Estonia",country_code:"ES" )
# Country.create(country_name:"Egypt",country_code:"EY" )
# Country.create(country_name:"Ecuador",country_code:"EC" )
# Country.create(country_name:"Dominican Republic",country_code:"DR" )
# Country.create(country_name:"Denmark",country_code:"DN" )
# Country.create(country_name:"Czech Republic",country_code:"CZ" )
# Country.create(country_name:"Cyprus",country_code:"CY" )
# Country.create(country_name:"Cuba",country_code:"CU" )
# Country.create(country_name:"Croatia",country_code:"CRO" )
# Country.create(country_name:"Costa Rica",country_code:"CR" )
# Country.create(country_name:"Colombia",country_code:"CO" )
# Country.create(country_name:"China",country_code:"CH" )
# Country.create(country_name:"Chile",country_code:"CL" )
# Country.create(country_name:"Canada",country_code:"CN" )
# Country.create(country_name:"Cameroon",country_code:"CM" )
# Country.create(country_name:"Cambodia",country_code:"CA" )
# Country.create(country_name:"Bulgaria",country_code:"BU" )
# Country.create(country_name:"Brunei Darussalam",country_code:"BD" )
# Country.create(country_name:"Brazil",country_code:"BR" )
# Country.create(country_name:"Bosnia and Herzegovina",country_code:"BOHE" )

# Country.create(country_name:"Bolivia",country_code:"BO" )
# Country.create(country_name:"Bhutan",country_code:"BHU" )
# Country.create(country_name:"Bermuda",country_code:"BER" )
# Country.create(country_name:"Belgium",country_code:"BL" )
# Country.create(country_name:"Belarus",country_code:"BE" )
# Country.create(country_name:"Barbados",country_code:"BAR" )
# Country.create(country_name:"Bangladesh",country_code:"BA" )
# Country.create(country_name:"Bahrain",country_code:"BH" )
# Country.create(country_name:"Azerbaijan",country_code:"AZ" )
# Country.create(country_name:"Austria",country_code:"AU" )
# Country.create(country_name:"Australia",country_code:"AUS" )
# Country.create(country_name:"Argentina",country_code:"AR" )
# Country.create(country_name:"Angola",country_code:"AN" )
# Country.create(country_name:"Algeria",country_code:"AL" )
# Country.create(country_name: "Afghanistan",country_code: "AF")

# # for institution Admin User:
# InstitutionAdminUserAccount.create(role:"Primary Institutiton Administrator", publisher_id: "1",institution_name: "Adept Techno Demo", user_name: "PA01", status: "active",first_name: "test1", last_name: "test2",email: "test@gmail.com", phone: 9876543210, fax: "1234",password: "12345",comments: "test user", primary_count: 1)
# User.create(email: "ctssuperadmin@bookstoredev.com",password: "adi@1234", admin: "false")

#InstitutionAccount.where(id: 58).last.update_attributes(end_user_id: 2)
#InstitutionAccount.where(id: 58).last.ip_addresses.last.update_attributes(low_ip: "999323992")


no_of_chapters =    [10,8,8,7,8,6,7,6,10,9,7,8,7,7,6,7,11,10,12,7,9,6,7,11,15,16,10,7,9,10,14,14,10,14,12,8,14,11,12,9,11,10,10,12,14,8,8,12,14,11,13,16,13,10,11,12,11,8,9,7,11,6,5,7,9,6,8,6,9,10,7,9,8,8,7,10,7,8,9,6,11,11,9,10,10,10,8,10,5,10,10,12,7,6,4,6,7,8,7,6,8,10,9,10,6,6,6,7,8,5,8,11,5,9,6,9,9,10,13,15,10,7,9,10,9,5,10,7,8,6,8,9,8,6,7,10,13,12,11,13,8,15,10,14,12,14,12,9,13,13,15,10,8,12,13,10,9,14,13,14,11,12,10,13,8,11,12,4,7,9,6,6,7,5,11,5,7,7,15,4,5,6,5,6,6,6,11,9,10,9,6,13,14,19,7,9,11,14,10,13,13,11,11,10,13,9,9,16,8,10,17,12,14,10,9,12,11,12,13,13,8,11,11,17,13,11,12,11,10,8,9,12,10,11,13,18,6,12,10,13,10,9,7,8,8,11,10,6,8,10,12,9,14,12,9,16,10,13,9,12,11,7,13,9,13,9,10,9,12,10,11,14,9,11,13,10,9,9,11,12,9,12,8,6,9,7,12,8,7,10,9,9,11,7,10,7,9,7,9,7,11,8,10,12,6,15,7,10,7,7,8,10,11,5,12,9,8,11,8,9,8,10,7,8,8,9,8,9,10,10,8,8,8,9,9,7,10,8,8,11,10,7,11,9,8,8,14,9,9,8,8,7,5,8,10,11,7,11,9,7,11,8,9,8,9,7,9,9,7,8,9,4,6,5,5,5,14,7,9,9,11,9,8,10,7,9,9,7,9,7,8,6,8,7,16,12,8,9,13,22,17,17,13,16,18,21,21,17,28,12,12,8,8,27,6,24,20,21,27,11,13,17,10,20,8,7,6,16,18,11,5,23,12,23,26,20,13,26,10,18,15,11,25,27,23,10,25,13,33,11,15,33,26,27,33,8,24,11,21,27,21,28,27,22,7,9,34,27,17,22,18,24,15,31,36,26,11,14,21,24,26,23,31,6,24,20,22,35,22,24,17,10,24,24,16,25,23,9,9,18,20,1,2,2,3,1,3,2,2,7,14,23,11,20,21,15,12,23,29,31,23,26,28,21,8,26,23,11,18,18,22,26,10,12,10,26,20,17,11,13,14,14,11,12,15,1,8,11,16,28,16,8,30,6,25,7,16,9,25,21,14,20,12,35,23,7,18,23,23,23,27,21,28,25,22,22,24,25,22,28,32,22,33,22,20,9,28,37,24,7,
22,7,22,31,28,18,14,18,21,20,14,26,22,24,18,7,7,16,8,12,23,21,20,24,20,15,2,5,31,16,21,25,18,19,20,28,19,17,15,17,20,16,19,12,19,18,23,17,27,11,40,11,10,12,18,22,32,31,40,32,23,30,17,19,24,22,14,9,22,9,7,28,9,5,24,10,12,17,10,5,11,20,18,6,20,22,21,19,12,20,18,23,7,22,11,23,29,24,24,27,25,21,23,13,7,15,9,22,10,17,13,11,22,24,17,17,18,22,20,13,15,12,9,28,18,15,20,21,5,20,20,28,30,5,13,17,6,13,29,9,8,10,14,13,19,12,12,9,22,21,18,19,15,18,19,21,21,18,13,19,14,18,21,19,34,12,28,8,8,42,9,25,15,10,10,25,18,17,12,27,8,7,8,17,11,12,13,28,22,23,12,19,25,11,27,9,13,22,21,28,17,24,30,19,20,5,15,24,24,8,13,14,16,16,29,5,9,6,7,19,20,10,9,10,10,9,23,25,25,16,14,5,24,24,11,19,7,31,5,10,12,9,7,7,24,8,7,12,8,13,11,12,34,21,13,18,14,13,19,9,7,24,7,6,12,9,11,16,26,21,21,10,11,26,19,17,7,12,9,11,29,28,22,15,20,17,39,25,26,15,17,14,8,45,21,38,19,9,13,24,18,9,24,13,6,19,12,17,15,19,26,22,26,17,27,31,14,16,7,15,8,15,9,15,16,27,11,33,15,7,6,23,19,10,16,33,15,15,31,17,30,6,26,32,15,24,17,8,12,15,17,11,12,17,15,46,22,8,30,22,22,24,14,14,36,12,12,6,14,19,8,9,7,18,28,14,13,10,8,7,48,8,14,7,21,7,22,12,40,23,24,23,22,31,40,18,25,21,23,44,11,7,22,44,24,15,14,10,48,27,22,6,31,13,9,7,17,30,9,28,27,16,25,11,23,26,13,27,23,18,21,9,9,30,32,30,32,25,23,25,37,40,39,33,30,25,29,21,27,29,22,23,35,27,8,23,7,24,22,15,24,16,16,31,28,24]

ids = [1147,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2171,2172,2173,2174,2175,2176,2177,2178,2179,2180,2181,2182,2183,2184,2185,2186,2187,2188,2189,2190,2191,2192,2193,2194,2195,2196,2197,2198,2199,2200,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213,2214,2215,2216,2217,2218,2219,2220,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,2231,2232,2233,2234,2235,2236,2237,2238,2239,2240,2241,2242,2243,2244,2245,2246,2247,2248,2249,2250,2251,2252,2253,2254,2255,2256,2257,2258,2259,2260,2261,2262,2263,2264,2265,2266,2267,2268,2269,2270,2271,2272,2273,2274,2275,2276,2277,2278,2279,2280,2281,2282,2283,2284,2285,2286,2287,2288,2289,2290,2291,2292,2293,2294,2295,2296,2297,2298,2299,2300,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2316,2317,2318,2319,2320,2321,2322,2323,2324,2325,2326,2327,2328,2329,2330,2331,2332,2333,2334,2335,2336,2337,2338,2339,2340,2341,2342,2343,2344,2345,2346,2347,2348,2349,2350,2351,2352,2353,2354,2355,2356,2357,2358,2359,2360,2361,2362,2363,2364,2365,2366,2367,2368,2369,2370,2371,2372,2373,2374,2375,2376,2377,2378,2379,2380,2381,2382,2383,2384,2385,2386,2387,2388,2389,2390,2391,2392,2393,2394,2395,2396,2397,2398,2399,2400,2401,2402,2403,2404,2405,2406,2407,2408,2409,2410,2411,2412,2413,2414,2415,2416,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2430,2431,2432,2433,2434,2435,2436,2437,2438,2439,2440,2441,2442,2443,2444,2445,2446,2447,2448,2449,2450,2451,2452,2453,2454,2455,2456,2457,2458,2459,2460,2461,2462,2463,2464,2465,2466,2467,2468,2469,2470,2471,2472,2473,2474,2475,2476,2477,2478,2479,2480,2481,2482,2483,2484,2485,2486,2487,2488,2489,2490,2491,2492,2493,2494,2495,2496,2497,2498,2499,2500,2501,2502,2503,2504,2505,2506,2507,2508,2509,2510,2511,2512,2513,2514,2515,2516,2517,4084,4543,4544,4545,4546,4547,4548,4549,4550,4551,4552,4553,4554,4555,4556,4557,4558,4559,4560,4561,4562,4563,4564,4565,4566,4567,4568,4569,4570,4571,4572,4573,4574,4575,4576,4577,4578,4579,4580,4581,4582,4583,4584,4585,4586,4587,4588,4589,4590,4591,4592,4593,4594,4595,4596,4597,4598,4599,4600,4601,4602,4603,4604,4605,4606,4607,4608,4609,4738,4739,4740,4741,4742,4743,4744,4745,4746,4747,4748,4749,4750,4751,4752,4753,4754,4755,4756,4757,4758,4759,4760,4761,4762,4763,4765,4766,4767,4768,4769,4770,4771,4772,4773,4774,4775,4776,4777,4780,4781,4782,4783,4784,4785,4786,4788,4789,4790,4791,4792,4793,4794,4795,4796,4797,4798,4799,4801,4802,4803,4804,4805,4806,4807,4808,4809,4810,4811,4812,4813,4814,4815,4816,4817,4818,4819,4820,4821,4822,4823,4824,4825,4826,4827,4828,4829,4830,4831,4832,4833,4834,4835,4836,4837,4838,4839,4840,4841,4842,4843,4844,4845,4846,4847,4848,4849,4850,4851,4852,4853,4854,4855,4856,4857,4858,4859,4860,4861,4862,4863,4864,4865,4866,4867,4868,4869,4870,4871,4873,4874,4875,4876,4877,4878,4879,4880,4881,4882,4883,4884,4885,4886,4887,4888,4889,4890,4891,4892,4893,4894,4895,4896,4897,4898,4899,4900,4901,4902,4903,4904,4905,4907,4908,4909,4910,4911,4912,4913,4914,4917,4918,4919,4920,4921,4922,4923,4924,4925,4926,4927,4928,4929,4930,4931,4933,4934,4935,4936,4937,4938,4939,4940,4941,4942,4943,4944,4945,4946,4947,4948,4949,4950,4951,4952,4953,4954,4955,4956,4957,4958,4959,4960,4961,4962,4963,4964,4965,4966,4967,4968,4970,4972,4973,4974,4975,4976,4977,4979,4980,4981,4982,4983,4984,4985,4986,4987,4989,4990,4991,4992,4993,4994,4995,4996,4997,4998,4999,5000,5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5022,5023,5024,5025,5026,5027,5028,5029,5030,5031,5032,5033,5034,5035,5036,5037,5038,5039,5040,5041,5042,5043,5044,5045,5046,5047,5048,5049,5050,5051,5052,5053,5054,5055,5056,5057,5058,5059,5060,5061,5062,5063,5064,5065,5067,5068,5069,5070,5071,5072,5073,5074,5075,5076,5077,5078,5079,5080,5081,5082,5083,5084,5085,5086,5087,5088,5089,5090,5092,5093,5094,5095,5096,5097,5098,5099,5100,5101,5102,5103,5104,5105,5108,5109,5110,5111,5112,5113,5114,5115,5116,5117,5118,5119,5120,5121,5122,5123,5124,5125,5126,5127,5128,5129,5130,5131,5132,5133,5134,5135,5136,5137,5138,5139,5140,5141,5142,5143,5144,5145,5146,5147,5148,5149,5150,5154,5155,5156,5157,5158,5159,5160,5161,5162,5165,5166,5167,5168,5169,5170,5171,5174,5176,5177,5178,5179,5180,5181,5182,5183,5184,5185,5186,5187,5188,5189,5190,5191,5192,5193,5194,5195,5196,5197,5198,5199,5200,5201,5202,5203,5204,5205,5206,5207,5208,5209,5210,5211,5212,5213,5214,5215,5216,5217,5218,5219,5220,5221,5222,5224,5229,5230,5231,5232,5233,5234,5235,5236,5237,5238,5239,5240,5241,5242,5243,5244,5245,5246,5247,5248,5249,5250,5251,5252,5253,5254,5255,5256,5257,5258,5259,5260,5263,5264,5265,5266,5268,5269,5270,5271,5272,5273,5274,5275,5276,5277,5278,5279,5280,5281,5282,5283,5284,5285,5286,5287,5288,5289,5290,5291,5292,5293,5294,5295,5300,5301,5302,5303,5304,5305,5306,5307,5308,5309,5310,5311,5312,5314,5315,5316,5317,5318,5319,5320,5321,5322,5323,5324,5325,5326,5327,5328,5329,5330,5331,5332,5333,5335,5336,5337,5338,5339,5340,5341,5342,5343,5344,5346,5347,5348,5349,5350,5351,5352,5353,5354,5355,5356,5357,5358,5359,5360,5361,5362,5363,5364,5365,5366,5367,5368,5369,5371,5372,5373] 
 BooksChapterDetail.where(id: ids).each do |ind|
  no_of_chapters.each do |noc|
 	db = ind.update_attributes(number_of_chapters: noc)
  end
end











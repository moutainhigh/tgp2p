package com.tpy.p2p.APP.admin.Util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MyUtil {

	public static Map<String, Object> cleanMap(Map<String, Object> info) {
		for (String key : info.keySet()) {

			Object value = info.get(key);
			if (value == null) {
				info.remove(key);
			}

		}
		return info;
	}

	public static List<Object> cleanList(List<Object> info) {
		for (int x = 0; x < info.size(); x++) {

			if (info.get(x) == null) {
				info.remove(x);
			}

		}
		return info;
	}

	public static JSONObject filterInnerObj(List<Object> data) {
		JSONObject res = new JSONObject();
		for (Object value : data) {
			Field[] allfiled = value.getClass().getDeclaredFields();
			Method[] allmethod = value.getClass().getDeclaredMethods();
			for (int x = 0; x < allfiled.length; x++) {
				String type = allfiled[x].getGenericType().toString();
				if (!type.contains("class com")) {
					String methodName = allfiled[x].getName().substring(0, 1)
							.toUpperCase()
							+ allfiled[x].getName().substring(1);
					if (allmethod[x].getName().contains("get")
							&& methodName.equals(allmethod[x].getName())) {
						try {
							res.accumulate(allfiled[x].getName(),
									allmethod[x].invoke(value));
						} catch (IllegalAccessException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IllegalArgumentException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (InvocationTargetException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}

			}

		}

		return res;
	}

	/**
	 * @param models
	 * @return JSONObject
	 * @param Object
	 *            单个实体解析
	 */
	public static JSONObject singleEntityValue(Object model) {

		JSONObject res = new JSONObject();
		if (model != null) {
			Field[] field = model.getClass().getDeclaredFields(); // 获取实体类的所有属性，返回Field数组
			List<Field> list = Arrays.asList(field);

			for (int j = 0; j < list.size(); j++) { // 遍历所有属性
				String fname = list.get(j).getName(); // 获取属性的名字
				fname = fname.substring(0, 1).toUpperCase()
						+ fname.substring(1); // 将属性的首字符大写，方便构造get，set方法
				String type = list.get(j).getGenericType().toString(); // 获取属性的类型
				try {
					Method m = model.getClass().getMethod("get" + fname);
					if (type.equals("class java.lang.String")) { // 如果type是类类型，则前面包含"class "，后面跟类名

						String value = (String) m.invoke(model); // 调用getter方法获取属性值
						if (value == null) {
							m = model.getClass().getMethod("set" + fname,
									String.class);
							m.invoke(model, "");
							value = "";
						}
						res.put(fname, value);
					}
					if (type.equals("class java.lang.Long")) { // 如果type是类类型，则前面包含"class "，后面跟类名

						Long value = (Long) m.invoke(model); // 调用getter方法获取属性值
						if (value == null) {
							m = model.getClass().getMethod("set" + fname,
									String.class);
							m.invoke(model, 0);
						}
						res.put(fname, value);
					}

					if (type.equals("class java.lang.Integer")
							|| type.equals("int")) {
						Integer value = (Integer) m.invoke(model);
						if (value == null) {
							m = model.getClass().getMethod("set" + fname,
									Integer.class);
							m.invoke(model, 0);
							value=0;
						}
						res.put(fname, value);
					}
					if (type.equals("class java.lang.Boolean")) {
						Boolean value = (Boolean) m.invoke(model);
						if (value == null) {
							m = model.getClass().getMethod("set" + fname,
									Boolean.class);
							m.invoke(model, false);
						}
						res.put(fname, value);
					}
					if (type.equals("class java.util.Date")) {
						Date value = (Date) m.invoke(model);
						if (value == null) {
							m = model.getClass().getMethod("set" + fname,
									Date.class);
							m.invoke(model, new Date());
						}
						res.put(fname, value);
					}
					if (type.equals("class java.lang.Double")
							|| type.equals("double")) {
						Double value = (Double) m.invoke(model);
						if (value == null) {
							m = model.getClass().getMethod("set" + fname,
									Double.class);
							m.invoke(model, 0.0);
							value=0.0;
						}
						res.put(fname, value);
					}
					if (type.contains("class com.")) {
						continue;
					}

				} catch (NoSuchMethodException e) {
					fname = fname.substring(0, 1).toLowerCase()
							+ fname.substring(1);
					String value;
					try {
						Method m = model.getClass().getMethod("get" + fname);
						value = (String) m.invoke(model);
						if (value == null) {
							m = model.getClass().getMethod("set" + fname,
									String.class);
							m.invoke(model, "");
						}
						res.put(fname, value);
						continue;
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}

				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					if (type.equals("class java.lang.Long")
							|| type.equals("class java.lang.Integer")) {
						res.put(fname, 0);
					} else if (type.equals("class java.lang.Double")) {
						res.put(fname, 0.0);
					}
					continue;
				}

			}

		} else {
			res.put("enTity", null);
		}

		return res;
	}

	/**
	 * @param models
	 * @return JSONArray
	 */
	public static JSONArray sameEntityValue(List<Object> models) {
		JSONArray res = new JSONArray();
		for (int x = 0; x < models.size(); x++) {
			JSONObject item = new JSONObject();
			Object model = models.get(x);
			if (model != null) {
				Field[] field = model.getClass().getDeclaredFields(); // 获取实体类的所有属性，返回Field数组
				List<Field> list = Arrays.asList(field);

				for (int j = 0; j < list.size(); j++) { // 遍历所有属性
					String fname = list.get(j).getName(); // 获取属性的名字
					fname = fname.substring(0, 1).toUpperCase()
							+ fname.substring(1); // 将属性的首字符大写，方便构造get，set方法
					String type = list.get(j).getGenericType().toString(); // 获取属性的类型
					try {
						Method m = model.getClass().getMethod("get" + fname);
						if (type.equals("class java.lang.String")) { // 如果type是类类型，则前面包含"class "，后面跟类名

							String value = (String) m.invoke(model); // 调用getter方法获取属性值
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										String.class);
								m.invoke(model, "");
								value = "";
							}
							item.put(fname, value);
						}
						if (type.equals("class java.lang.Long")) { // 如果type是类类型，则前面包含"class "，后面跟类名

							Long value = (Long) m.invoke(model); // 调用getter方法获取属性值
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										String.class);
								m.invoke(model, 0);
							}
							item.put(fname, value);
						}

						if (type.equals("class java.lang.Integer")
								|| type.equals("int")) {
							Integer value = (Integer) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										Integer.class);
								m.invoke(model, 0);
							}
							item.put(fname, value);
						}
						if (type.equals("class java.lang.Boolean")) {
							Boolean value = (Boolean) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										Boolean.class);
								m.invoke(model, false);
							}
							item.put(fname, value);
						}
						if (type.equals("class java.util.Date")) {
							Date value = (Date) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										Date.class);
								m.invoke(model, new Date());
							}
							item.put(fname, value);
						}
						if (type.equals("class java.lang.Double")
								|| type.equals("double")) {
							Double value = (Double) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										Double.class);
								m.invoke(model, 0.0);
							}
							item.put(fname, value);
						}
						if (type.contains("class com.")) {
							continue;
						}

					} catch (NoSuchMethodException e) {
						fname = fname.substring(0, 1).toLowerCase()
								+ fname.substring(1);
						String value;
						try {
							Method m = model.getClass()
									.getMethod("get" + fname);
							value = (String) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										String.class);
								m.invoke(model, "");
							}
							item.put(fname, value);
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}

					} catch (SecurityException e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						if (type.equals("class java.lang.Long")
								|| type.equals("class java.lang.Integer")) {
							item.put(fname, 0);
						} else if (type.equals("class java.lang.Double")) {
							item.put(fname, 0.0);
						}
						continue;
					}

				}

			} else {
				item.put("enTity", null);
			}
			res.add(item);
		}
		return res;
	}

	public static JSONObject AllEntityValue(List<Object> models) {
		JSONObject res = new JSONObject();
		for (Object model : models) {
			if (model != null) {
				Field[] field = model.getClass().getDeclaredFields(); // 获取实体类的所有属性，返回Field数组
				List<Field> list = Arrays.asList(field);

				for (int j = 0; j < list.size(); j++) { // 遍历所有属性
					String fname = list.get(j).getName(); // 获取属性的名字
					fname = fname.substring(0, 1).toUpperCase()
							+ fname.substring(1); // 将属性的首字符大写，方便构造get，set方法
					String type = list.get(j).getGenericType().toString(); // 获取属性的类型
					try {

						if (type.equals("class java.lang.String")) { // 如果type是类类型，则前面包含"class "，后面跟类名

							Method m = model.getClass()
									.getMethod("get" + fname);
							String value = (String) m.invoke(model); // 调用getter方法获取属性值
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										String.class);
								m.invoke(model, "");
							}
							res.put(fname, value);
						}
						if (type.equals("class java.lang.Long")) { // 如果type是类类型，则前面包含"class "，后面跟类名

							Method m = model.getClass()
									.getMethod("get" + fname);
							Long value = (Long) m.invoke(model); // 调用getter方法获取属性值
							/*
							 * if (value == null) { m =
							 * model.getClass().getMethod("set" + fname,
							 * String.class); m.invoke(model, 0); }
							 */
							res.put(fname, value);
						}

						if (type.equals("class java.lang.Integer")) {
							Method m = model.getClass()
									.getMethod("get" + fname);
							Integer value = (Integer) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										Integer.class);
								m.invoke(model, 0);
							}
							res.put(fname, value);
						}
						if (type.equals("class java.lang.Boolean")) {
							Method m = model.getClass()
									.getMethod("get" + fname);
							Boolean value = (Boolean) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										Boolean.class);
								m.invoke(model, false);
							}
							res.put(fname, value);
						}
						if (type.equals("class java.util.Date")) {
							Method m = model.getClass()
									.getMethod("get" + fname);
							Date value = (Date) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										Date.class);
								m.invoke(model, new Date());
							}
							res.put(fname, value);
						}
						if (type.equals("class java.lang.Double")) {
							Method m = model.getClass()
									.getMethod("get" + fname);
							Double value = (Double) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										Double.class);
								m.invoke(model, 0.0);
							}
							res.put(fname, value);
						}
						if (type.contains("class com.")) {
							continue;
						}

					} catch (NoSuchMethodException e) {
						fname = fname.substring(0, 1).toLowerCase()
								+ fname.substring(1);
						String value;
						try {
							Method m = model.getClass()
									.getMethod("get" + fname);
							value = (String) m.invoke(model);
							if (value == null) {
								m = model.getClass().getMethod("set" + fname,
										String.class);
								m.invoke(model, "");
							}
							res.put(fname, value);
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}

					} catch (SecurityException e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						if (type.equals("class java.lang.Long")
								|| type.equals("class java.lang.Integer")) {
							res.put(fname, 0);
						} else if (type.equals("class java.lang.Double")) {
							res.put(fname, 0.0);
						}
						continue;
					}
				}

			} else {
				res.put("enTity", null);
			}

		}
		return res;
	}

}

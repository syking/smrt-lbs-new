package controllers.api;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import annotations.Perm;

import models.Permission;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.PermVO;
import controllers.Interceptor;

/**
 * Permissions API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Permissions extends Controller{
	/**
	 * Fetch perm's info
	 * @param perm
	 */
	@Perm
	public static void index(final int page, final int pageSize, PermVO perm){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Permission.search(page, pageSize, perm))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.PERM_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get perm info
	 * @param id
	 */
	@Perm
	public static void show(Long id){
		try{
			Permission perm = Permission.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(new PermVO(perm))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.PERM_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Create perm info
	 * @param models
	 */
	@Perm
	public static void create(final PermVO perm) {
		
		try{
			PermVO _perm = Permission.createByVO(perm);
			renderHtml(CommonUtil.toJson(APICallback.success(_perm)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(perm, APIError.PERM_CERATE_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Update perm info
	 * @param perm
	 */
	@Perm
	public static void update(final PermVO perm){
		
		try{
			Permission.updateByVO(perm);
			renderHtml(CommonUtil.toJson(APICallback.success(perm)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.PERM_UPDATE_FAIL, e.getMessage())));
		}
	}

	/**
	 * Delete perm info
	 * @param id
	 */
	@Perm
	public static void destroy(Long id) {
		try{
			Permission.deleteById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(id)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(id, APIError.PERM_DESTROY_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get actions
	 */
	@Perm
	public static void actions() {
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Permission.assemActions())));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.PERM_FETCH_FAIL, e.getMessage())));
		}
	}
}

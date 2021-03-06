


{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Modify the information</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
             


					<div class="col-lg-6 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Change Password</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="oldpwd">Current password</label>
											<input class="form-control" id="oldpwd" type="password">
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="pwd">New password</label>
											<input class="form-control" id="pwd" type="password">
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="repwd">Confirm the new password</label>
											<input class="form-control" id="repwd" type="password">
										</div>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="pwd-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Connection password modification</p>
										<p>Current connection password: {$user->passwd}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="sspwd">Connection password</label>
											<input class="form-control" id="sspwd" type="text">
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="ss-pwd-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Encryption mode modification</p>
										<p>Note: SS and SSR support the encryption method is different, according to the actual situation to choose!</p>
										<p>Current encryption:{$user->method}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="method">Encryption</label>
											<select id="method" class="form-control">
												{$method_list = $config_service->getSupportParam('method')}
												{foreach $method_list as $method}
													<option value="{$method}" {if $user->method == $method}selected="selected"{/if}>[{if URL::CanMethodConnect($method) == 2}SS{else}SS/SSR{/if} Can be connected] {$method}</option>
												{/foreach}
											</select>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button disabled="disabled" class="btn btn-flat waves-attach" id="method-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div> 

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Contact Modification</p>
										<p>Current contact：
										{if $user->im_type==1}
										Wechat
										{/if}

										{if $user->im_type==2}
										QQ
										{/if}

										{if $user->im_type==3}
										Google+
										{/if}

										{if $user->im_type==4}
										Telegram
										{/if}

										{$user->im_value}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="imtype">Choose your contact information</label>
											<select class="form-control" id="imtype">
												<option></option>
												<option value="1">Wechat</option>
												<option value="2">QQ</option>
												<option value="3">Google+</option>
												<option value="4">Telegram</option>
											</select>
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="wechat">Enter the contact number here</label>
											<input class="form-control" id="wechat" type="text">
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="wechat-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Protocol & confusing settings</p>
										<p>Current agreement：{$user->protocol}</p>
										<p>Note 1: If you need to be compatible with the original version of the SS Please choose with _compatible compatibility options!</p>
										<p>Note 2: If you use the original SS client here please set it directly as origin!</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="protocol">Protocol</label>
											<select id="protocol" class="form-control">
												{$protocol_list = $config_service->getSupportParam('protocol')}
												{foreach $protocol_list as $protocol}
													<option value="{$protocol}" {if $user->protocol == $protocol}selected="selected"{/if}>[{if URL::CanProtocolConnect($protocol) == 3}SS/SSR{else}SSR{/if} Can be connected] {$protocol}</option>
												{/foreach}
											</select>
										</div>

									</div>

									<div class="card-inner">
										<p>Current confusing:{$user->obfs}</p>
										<p>Note 1: If you need to be compatible with the original version of the SS Please choose with _compatible compatibility options!</p>
										<p>Note 2: SS and SSR support the confusion type is different, simple_obfs_ * for the original SS confusing way, the other for the SSR confusing way!</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="obfs">Confused way</label>
											<select id="obfs" class="form-control">
												{$obfs_list = $config_service->getSupportParam('obfs')}
												{foreach $obfs_list as $obfs}
													<option value="{$obfs}" {if $user->obfs == $obfs}selected="selected"{/if}>[{if URL::CanObfsConnect($obfs) >= 3}SS/SSR{else}{if URL::CanObfsConnect($obfs) == 1}SSR{else}SS{/if}{/if} Can be connected] {$obfs}</option>
												{/foreach}
											</select>
										</div>
									</div>

									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button disabled="disabled" class="btn btn-flat waves-attach" id="ssr-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>







						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Theme change</p>
										<p>Current theme：{$user->theme}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="theme">Theme</label>
											<select id="theme" class="form-control">
												{foreach $themes as $theme}
													<option value="{$theme}">{$theme}</option>
												{/foreach}
											</select>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="theme-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>  


					<div class="col-lg-6 col-md-6">

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">IP decapsulation</p>
										<p>Current state：{$Block}</p>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="unblock" ><span class="icon">check</span>&nbsp;Unlocked</button>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Daily mail reception settings</p>
										<p>Current setting：{if $user->sendDailyMail==1} send {else} Do not send {/if}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="mail">Send settings</label>
											<select id="mail" class="form-control">
												<option value="1">Send</option>
												<option value="0">Do not send</option>
											</select>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="mail-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>



					<!--	<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">两步验证</p>
										<p>请下载 Google 的两步验证器，扫描下面的二维码。</p>
										<p><i class="icon icon-lg" aria-hidden="true">android</i><a href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2">&nbsp;Android</a></p>
										<p><i class="icon icon-lg" aria-hidden="true">tablet_mac</i><a href="https://itunes.apple.com/cn/app/google-authenticator/id388497605?mt=8">&nbsp;iOS</a></p>
										<p>在没有测试完成绑定成功之前请不要启用。</p>
										<p>当前设置：{if $user->ga_enable==1} 登录时要求验证 {else} 不要求 {/if}</p>
										<p>当前服务器时间：{date("Y-m-d H:i:s")}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="ga-enable">验证设置</label>
											<select id="ga-enable" class="form-control">
												<option value="0">不要求</option>
												<option value="1">要求验证</option>
											</select>
										</div>


										<div class="form-group form-group-label">
											<div class="text-center">
												<div id="ga-qr"></div>
												密钥：{$user->ga_token}
											</div>
										</div>


										<div class="form-group form-group-label">
											<label class="floating-label" for="code">测试一下</label>
											<input type="text" id="code" placeholder="输入验证器生成的数字来测试" class="form-control">
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-brand-accent btn-flat waves-attach" href="/user/gareset" ><span class="icon">format_color_reset</span>&nbsp;重置</a>
											<button class="btn btn-flat waves-attach" id="ga-test" ><span class="icon">extension</span>&nbsp;测试</button>
											<button class="btn btn-brand btn-flat waves-attach" id="ga-set" ><span class="icon">perm_data_setting</span>&nbsp;设置</button>
										</div>
									</div>
								</div>
							</div>
						</div>    -->

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Reset the port</p>
										<p>Current port：{$user->port}</p>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="portreset" ><span class="icon">check</span>&nbsp;Reset the port</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Customize ACL / PAC / Surge</p>
										<p>You can add the Gfwlist rule here.</p>
										<p>Format see<a href="https://adblockplus.org/zh_CN/filters">https://adblockplus.org/zh_CN/filters</a></p>
										<p>IP segment Please use | 127.0.0.0/8 similar format</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="pac">Rule writing area</label>
											<textarea class="form-control" id="pac" rows="8">{$user->pac}</textarea>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="setpac" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						{if $config['enable_telegram'] == 'true'}
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Telegram Bind</p>
										<p>Telegram Add a robot account <a href="https://t.me/{$telegram_bot}">@{$telegram_bot}</a>, Photographed the following two-dimensional code issued to it.</p>
										<div class="form-group form-group-label">
											<div class="text-center">
												<div id="telegram-qr"></div>
												{if $user->telegram_id != 0} Current binding：<a href="https://t.me/{$user->im_value}">@{$user->im_value}</a>{/if}
											</div>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-brand-accent btn-flat waves-attach" href="/user/telegram_reset" ><span class="icon">format_color_reset</span>&nbsp;Unbundled</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						{/if}
					</div>




					{include file='dialog.tpl'}

			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>
    $(document).ready(function () {
        $("#portreset").click(function () {
            $.ajax({
                type: "POST",
                url: "resetport",
                dataType: "json",
                data: {

                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#setpac").click(function () {
            $.ajax({
                type: "POST",
                url: "pacset",
                dataType: "json",
                data: {
                   pac: $("#pac").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "password",
                dataType: "json",
                data: {
                    oldpwd: $("#oldpwd").val(),
                    pwd: $("#pwd").val(),
                    repwd: $("#repwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                         $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script src=" /assets/public/js/jquery.qrcode.min.js "></script>
<script>
	var ga_qrcode = '{$user->getGAurl()}';
	jQuery('#ga-qr').qrcode({
		"text": ga_qrcode
	});

	{if $config['enable_telegram'] == 'true'}
	var telegram_qrcode = 'mod://bind/{$bind_token}';
	jQuery('#telegram-qr').qrcode({
		"text": telegram_qrcode
	});
	{/if}
</script>


<script>
    $(document).ready(function () {
        $("#wechat-update").click(function () {
            $.ajax({
                type: "POST",
                url: "wechat",
                dataType: "json",
                data: {
                    wechat: $("#wechat").val(),
					imtype: $("#imtype").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#ssr-update").click(function () {
            $.ajax({
                type: "POST",
                url: "ssr",
                dataType: "json",
                data: {
                    protocol: $("#protocol").val(),
					obfs: $("#obfs").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#relay-update").click(function () {
            $.ajax({
                type: "POST",
                url: "relay",
                dataType: "json",
                data: {
                    relay_enable: $("#relay_enable").val(),
					relay_info: $("#relay_info").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#unblock").click(function () {
            $.ajax({
                type: "POST",
                url: "unblock",
                dataType: "json",
                data: {
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ga-test").click(function () {
            $.ajax({
                type: "POST",
                url: "gacheck",
                dataType: "json",
                data: {
                    code: $("#code").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ga-set").click(function () {
            $.ajax({
                type: "POST",
                url: "gaset",
                dataType: "json",
                data: {
                    enable: $("#ga-enable").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ss-pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                 success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html("Succeeded");
                    } else {
                        $("#result").modal();
						$("#msg").html("Failed");
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#mail-update").click(function () {
            $.ajax({
                type: "POST",
                url: "mail",
                dataType: "json",
                data: {
                    mail: $("#mail").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#theme-update").click(function () {
            $.ajax({
                type: "POST",
                url: "theme",
                dataType: "json",
                data: {
                    theme: $("#theme").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>



<script>
    $(document).ready(function () {
        $("#method-update").click(function () {
            $.ajax({
                type: "POST",
                url: "method",
                dataType: "json",
                data: {
                    method: $("#method").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html("Succeeded");
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

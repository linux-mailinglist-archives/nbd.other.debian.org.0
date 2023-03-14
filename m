Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6556B8BE1
	for <lists+nbd@lfdr.de>; Tue, 14 Mar 2023 08:25:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0AAAF2044F; Tue, 14 Mar 2023 07:25:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 14 07:25:25 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 46C5E20446
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Mar 2023 07:25:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	GMAIL=1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iDMxySbPviS0 for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Mar 2023 07:25:08 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 220C720419
	for <nbd@other.debian.org>; Tue, 14 Mar 2023 07:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=f3vbZkVGZLUiypuTv5Li5o++alfqVs48wZ14Q8te/zQ=; b=EE8m91+9SKe3IfCPV5Ag66eXbL
	6YjGMuHlu6EqozdCx7KEPryBaQ+yICLIosLkq7WeoWydjREeXHrpk93ukvhjpled08DpO+gn0Tbyj
	ZTRZE992PPFzu0WXdaUjdi5WKwnb31TItWB4os9gBhOA77MqMBwCc6tGnmvqmaCqaPx5oTVcpiXMC
	c/h18tQjnOLbKKPishVEnS4dApeA50C41LA3Wf9s6zNHNXTXRLPJh0zHnrhJLWoLcUeYtBHixbJi6
	L4GkDT13PDwQjRZCw2YfuPcU6neRMxEs9AlhZKroEya9VT6sHFkM+FltTgK+WUsVuIPrCs8f2+vK7
	ZqsiLwtg==;
Received: from [196.251.239.242] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pbz1t-0078wS-Uo; Tue, 14 Mar 2023 08:25:05 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pbz1q-0002Js-15;
	Tue, 14 Mar 2023 09:25:02 +0200
Date: Tue, 14 Mar 2023 09:25:02 +0200
From: Wouter Verhelst <w@uter.be>
To: Takuya Wakazono <pastalian46@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] nbd-server: raise glib version requirement
Message-ID: <ZBAhTtQ8KngGACkc@pc220518.home.grep.be>
References: <20230311185820.29639-1-pastalian46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311185820.29639-1-pastalian46@gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZyuKYu4QdxL.A.KwC.lFCEkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2387
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZBAhTtQ8KngGACkc@pc220518.home.grep.be
Resent-Date: Tue, 14 Mar 2023 07:25:26 +0000 (UTC)

Applied, thanks.

On Sun, Mar 12, 2023 at 03:58:20AM +0900, Takuya Wakazono wrote:
> From: pastalian <pastalian46@gmail.com>
> 
> g_array_set_clear_func is only available since glib 2.32, so nbd-server
> cannot be compiled with lower versions of glib.
> This bump also makes previous workaround for old glib (dace3ad)
> unnecessary.
> 
> Signed-off-by: Takuya Wakazono <pastalian46@gmail.com>
> ---
>  configure.ac | 15 +--------------
>  nbd-server.c |  7 -------
>  2 files changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 62e56f4..8d72e46 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -286,7 +286,7 @@ AC_CHECK_HEADERS([sys/mount.h],,,
>  [[#include <sys/param.h>
>  ]])
>  AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h sys/ioctl.h sys/socket.h syslog.h linux/types.h sys/dirent.h sys/uio.h])
> -PKG_CHECK_MODULES(GLIB, [glib-2.0 >= 2.26.0 gthread-2.0 >= 2.26.0], [HAVE_GLIB=yes], AC_MSG_ERROR([Missing glib]))
> +PKG_CHECK_MODULES(GLIB, [glib-2.0 >= 2.32.0 gthread-2.0 >= 2.32.0], [HAVE_GLIB=yes], AC_MSG_ERROR([Missing glib]))
>  PKG_CHECK_MODULES(SW, [socket_wrapper], [HAVE_SW=yes], [HAVE_SW=no])
>  PKG_CHECK_MODULES(NW, [nss_wrapper], [HAVE_NW=yes], [HAVE_NW=no])
>  AM_CONDITIONAL(CWRAP, test "$HAVE_SW" = "yes" -a "$HAVE_NW" = "yes")
> @@ -295,19 +295,6 @@ my_save_cflags="$CFLAGS"
>  my_save_libs="$LIBS"
>  CFLAGS="-Wdeprecated-declarations -Werror $GLIB_CFLAGS"
>  LIBS="$GLIB_LIBS"
> -AC_MSG_CHECKING([if we are using an old glib 2.0 library])
> -AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
> -	[[#include <glib.h>]],
> -	[[g_thread_init(NULL);]])],
> -	[
> -		AC_MSG_RESULT(yes)
> -		AC_DEFINE(HAVE_OLD_GLIB, 1, [Define to 1 if you have an old glib library])
> -	],
> -	[
> -		AC_MSG_RESULT(no)
> -		AC_DEFINE(HAVE_OLD_GLIB, 0, [Define to 1 if you have an old glib library])
> -	]
> -)
>  dnl g_memdup2 added in glib-2.68
>  AC_CHECK_FUNCS([g_memdup2])
>  CFLAGS="$my_save_cflags"
> diff --git a/nbd-server.c b/nbd-server.c
> index 5787ddc..f942044 100644
> --- a/nbd-server.c
> +++ b/nbd-server.c
> @@ -116,10 +116,6 @@
>  
>  #include <glib.h>
>  
> -#if HAVE_OLD_GLIB
> -#include <pthread.h>
> -#endif
> -
>  /* used in cliserv.h, so must come first */
>  #define MY_NAME "nbd_server"
>  #include "cliserv.h"
> @@ -3708,9 +3704,6 @@ int main(int argc, char *argv[]) {
>  	}
>  	if (!nodaemon)
>  		daemonize();
> -#if HAVE_OLD_GLIB
> -	g_thread_init(NULL);
> -#endif
>  	tpool = g_thread_pool_new(handle_request, NULL, genconf.threads, FALSE, NULL);
>  
>  	setup_servers(servers, genconf.modernaddr, genconf.modernport,
> -- 
> 2.39.2
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EC53FFDDA
	for <lists+nbd@lfdr.de>; Fri,  3 Sep 2021 12:05:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 18D7120ADA; Fri,  3 Sep 2021 10:05:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep  3 10:05:58 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0701520AD4
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Sep 2021 10:05:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OtFQfLmO6GD2 for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Sep 2021 10:05:45 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6807B20AD1
	for <nbd@other.debian.org>; Fri,  3 Sep 2021 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PPR3hmYstyCfmwRp+I/khlsj2VdIH+LJ/imiVBJqRYE=; b=BMEcwF1PIAdSh8AHlwaSfzHiTR
	VWKTo4+Sn2ysXfhJeOWZcSfPEL9hCWkqFMomfEhI8oO5qx5xFeo1BQPIpF/seRaAnIcdYsxgndlSo
	ovLG/lBdKdZO/X9uREhkrhxBgBZy+Fz1nvOL3XvQ90eH2UyX1/Btv+pmhgbNUmjP1oBbgRKHJJ64z
	pmBFJlG0gjJ7T4i1dhHsxCUoozXppWyA3LCkwBSe7OEFTqHAKrntI3NMU+ppxEJRq/dpKOqWHqj6V
	7+aAhYieDjhDZ8/7XUJc4pSC60SDYadQbqi/ct6qIVszY8OCVitqQasDrQd/+WdL8aolngLcALyVK
	t1wk25Jw==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mM64t-007Ucn-2W; Fri, 03 Sep 2021 12:05:43 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mM64l-0001uQ-OA; Fri, 03 Sep 2021 12:05:35 +0200
Date: Fri, 3 Sep 2021 12:05:35 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] server: Avoid deprecated g_memdup
Message-ID: <YTHzbzDaM/TCdp+x@pc181009.grep.be>
References: <20210902185207.959912-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210902185207.959912-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Od97lQYacpK.A.3rG.GOfMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1368
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTHzbzDaM/TCdp+x@pc181009.grep.be
Resent-Date: Fri,  3 Sep 2021 10:05:58 +0000 (UTC)

LGTM, thanks -- please commit.

On Thu, Sep 02, 2021 at 01:52:07PM -0500, Eric Blake wrote:
> glib now recommends that we use g_memdup2() to avoid accidental 32-bit
> truncation bugs on platforms where g_size is larger than guint:
> 
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
> and failure to do so causes noisy compilation due to deprecation
> warnings with glib 2.68:
> 
> nbd-server.c: In function ‘parse_cfile’:
> nbd-server.c:1010:25: warning: ‘g_memdup’ is deprecated: Use 'g_memdup2' instead [-Wdeprecated-declarations]
>  1010 |                         SERVER *srv = serve_inc_ref(g_memdup(&s, sizeof(SERVER)));
>       |                         ^~~~~~
> In file included from /usr/include/glib-2.0/glib.h:82,
>                  from nbd-server.c:117:
> /usr/include/glib-2.0/glib/gstrfuncs.h:257:23: note: declared here
>   257 | gpointer              g_memdup         (gconstpointer mem,
>       |                       ^~~~~~~~
> 
> Of course, we still want to build on platforms with older glib that
> lack g_memdup2().  Thankfully, it's easy enough to audit that all our
> current uses of g_memdup() do not overflow 32 bits.
> ---
>  configure.ac | 5 +++++
>  nbd-server.c | 7 ++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 48ba507..9504899 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -292,7 +292,9 @@ AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h sys/ioctl.h sys/socke
>  PKG_CHECK_MODULES(GLIB, [glib-2.0 >= 2.26.0 gthread-2.0 >= 2.26.0], [HAVE_GLIB=yes], AC_MSG_ERROR([Missing glib]))
> 
>  my_save_cflags="$CFLAGS"
> +my_save_libs="$LIBS"
>  CFLAGS="-Wdeprecated-declarations -Werror $GLIB_CFLAGS"
> +LIBS="$GLIB_LIBS"
>  AC_MSG_CHECKING([if we are using an old glib 2.0 library])
>  AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
>  	[[#include <glib.h>]],
> @@ -306,7 +308,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
>  		AC_DEFINE(HAVE_OLD_GLIB, 0, [Define to 1 if you have an old glib library])
>  	]
>  )
> +dnl g_memdup2 added in glib-2.68
> +AC_CHECK_FUNCS([g_memdup2])
>  CFLAGS="$my_save_cflags"
> +LIBS="$my_save_libs"
> 
>  AC_MSG_CHECKING([whether _BSD_SOURCE needs to be defined for DT_* macros])
>  AC_PREPROC_IFELSE(
> diff --git a/nbd-server.c b/nbd-server.c
> index 0b32bcd..1eff99d 100644
> --- a/nbd-server.c
> +++ b/nbd-server.c
> @@ -154,6 +154,11 @@
>  #include <gnutls/x509.h>
>  #endif
> 
> +#ifndef HAVE_G_MEMDUP2
> +/* Our uses of g_memdup2 below are safe from g_memdup's 32-bit overflow */
> +#define g_memdup2 g_memdup
> +#endif
> +
>  /** Where our config file actually is */
>  gchar* config_file_pos;
> 
> @@ -1007,7 +1012,7 @@ GArray* parse_cfile(gchar* f, struct generic_conf *const genconf, bool expect_ge
>  		if(i>0 || !expect_generic) {
>  			s.servename = groups[i];
> 
> -			SERVER *srv = serve_inc_ref(g_memdup(&s, sizeof(SERVER)));
> +			SERVER *srv = serve_inc_ref(g_memdup2(&s, sizeof(SERVER)));
>  			g_array_append_val(retval, srv);
>  		}
>  #ifndef WITH_SDP
> -- 
> 2.31.1
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}


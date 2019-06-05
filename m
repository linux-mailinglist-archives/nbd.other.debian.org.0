Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F273621F
	for <lists+nbd@lfdr.de>; Wed,  5 Jun 2019 19:12:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 702DA2038F; Wed,  5 Jun 2019 17:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  5 17:12:09 2019
Old-Return-Path: <berrange@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=4.0 tests=FOURLA,FROM_EXCESS_BASE64,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3EFA420389
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Jun 2019 16:56:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.901 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FROM_EXCESS_BASE64=0.979,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qI9WQ7mJ48J3 for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Jun 2019 16:56:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A5B0F20298
	for <nbd@other.debian.org>; Wed,  5 Jun 2019 16:56:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67EDF309266A;
	Wed,  5 Jun 2019 16:56:05 +0000 (UTC)
Received: from redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 267845C640;
	Wed,  5 Jun 2019 16:56:01 +0000 (UTC)
Date: Wed, 5 Jun 2019 17:55:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, eblake@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190605165558.GQ8956@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190528103537.15081-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528103537.15081-1-rjones@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 05 Jun 2019 16:56:10 +0000 (UTC)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AdrncWRSmmL.A.ANH.pf_9cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/560
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190605165558.GQ8956@redhat.com
Resent-Date: Wed,  5 Jun 2019 17:12:09 +0000 (UTC)

On Tue, May 28, 2019 at 11:35:36AM +0100, Richard W.M. Jones wrote:
> Differences since v1:
> 
> - Make clear that we defer all questions about the NBD protocol
>   or how it works to the NBD protocol document.
> 
> - Make clear that the userinfo field is only needed for TLS
>   (not for NBD itself).
> 
> - `socket` parameter is still required, because I'm unhappy about
>   a client opening a local file if no socket is specified (it's
>   far more likely to be an error and opening a local file could
>   raise security concerns).
> 
> - Add various tls parameters.  The most controversial(?) aspect of
>   this is that I've gone with qemu-style certificates directory.

This is certainly good from QEMU's POV. QEMU has standardized
its own internal APIs handling loading of certificate, so even if
the NBD spec gave a different filenaming convention, QEMU would
likely carry on which what it already uses. It is more important
to QEMU to have consistent TLS cert filenames across all of its
different network services.

At least this part is merely a "SHOULD" and not a "MUST", so
applications do have flexibility to ignore this rule if they
so choose.

> - Document how clients which do not support TLS should behave.
> 
> - Document that Unix domain sockets may begin with an ASCII NUL
>   character on some platforms.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7AD243CCD
	for <lists+nbd@lfdr.de>; Thu, 13 Aug 2020 17:50:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6229B2041D; Thu, 13 Aug 2020 15:50:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 13 15:50:43 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B969220412
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Aug 2020 15:50:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PqtMjY-jo36o for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Aug 2020 15:50:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id 94A0B20410
	for <nbd@other.debian.org>; Thu, 13 Aug 2020 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597333824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3qBb4S5dRgQGADwgkax6V4y/CCS08fNjNzfMr6ZhF7s=;
	b=KA8YzFXnFEhHsVr7Iug1ZY2NZFAJk7GisttqRkR2x4AxfFOlfW28/6dczqOyZvIEMcR8Jy
	u/ZznnK5IpNjRTNrtlYfk6eVMcr7G8H4EeGM0rmAFnclLzZ9+Yv1b7g4e2P9dLNeHdqHBO
	Y2Lq+K9fhxNNOcFUKa4REgB/O7j4aeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-9CM9LKluMCGfrycTlXntXw-1; Thu, 13 Aug 2020 11:50:20 -0400
X-MC-Unique: 9CM9LKluMCGfrycTlXntXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC4F31009440;
	Thu, 13 Aug 2020 15:50:18 +0000 (UTC)
Received: from localhost (ovpn-114-99.ams2.redhat.com [10.36.114.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39A2019C78;
	Thu, 13 Aug 2020 15:50:17 +0000 (UTC)
Date: Thu, 13 Aug 2020 16:50:17 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Garver <eric@garver.life>
Cc: nbd@other.debian.org, firewalld-devel@lists.fedorahosted.org
Subject: Re: [PATCH firewalld] feat: service: add nbd (Network Block Device)
 service
Message-ID: <20200813155017.GX3888@redhat.com>
References: <20200813123854.967482-1-rjones@redhat.com>
 <20200813152831.GA5823@roberto>
MIME-Version: 1.0
In-Reply-To: <20200813152831.GA5823@roberto>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9A7WTpBJUfB.A.vXF.TFWNfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/932
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200813155017.GX3888@redhat.com
Resent-Date: Thu, 13 Aug 2020 15:50:43 +0000 (UTC)

On Thu, Aug 13, 2020 at 11:28:31AM -0400, Eric Garver wrote:
> On Thu, Aug 13, 2020 at 01:38:54PM +0100, Richard W.M. Jones wrote:
> > ---
> >  config/Makefile.am      | 1 +
> >  config/services/nbd.xml | 6 ++++++
> >  po/POTFILES.in          | 1 +
> >  3 files changed, 8 insertions(+)
> 
> Thanks! I applied and pushed this upstream:
> 
>     8f562559dad8 ("feat: service: add nbd (Network Block Device)
>     service")
> 
> The firewalld-devel list is defunct. Can you tell me where you found it
> referenced so I can update/remove the reference?

Sure, it's mentioned on the website:

https://firewalld.org/contribute.html

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F1B6A7A39
	for <lists+nbd@lfdr.de>; Thu,  2 Mar 2023 05:00:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C48D220691; Thu,  2 Mar 2023 04:00:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  2 04:00:16 2023
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=AVAILABLENOW,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E78222057D
	for <lists-other-nbd@bendel.debian.org>; Thu,  2 Mar 2023 03:43:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.202 tagged_above=-10000 required=5.3
	tests=[AVAILABLENOW=1, BAYES_00=-2, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rNfed-l40TLF for <lists-other-nbd@bendel.debian.org>;
	Thu,  2 Mar 2023 03:43:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 319E720576
	for <nbd@other.debian.org>; Thu,  2 Mar 2023 03:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677728581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6m+KHAHNOsR6xNmwXLEtRMEJIUs6S4oYwxVd38E51ks=;
	b=a1+zV8ZsQZkA4nuRNbDAzl02fAUaEWcdQ/kGtKdb1OWgYoJ+yYhqfN0Zo23YXlP2i00QDG
	kUiK2jtycX8nTwht3SaTXbPsPvSJvfDDQXS0c/nSLZgDQARRKkHTZ9nA1ySjrsomRyaiCr
	Ux+CjP2hynU1jbt6BnhOdLJirFNqIY4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-SdDSsMyaOaqFLeYc4RhWog-1; Wed, 01 Mar 2023 22:11:33 -0500
X-MC-Unique: SdDSsMyaOaqFLeYc4RhWog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3016785A5A3;
	Thu,  2 Mar 2023 03:11:33 +0000 (UTC)
Received: from T590 (ovpn-8-26.pek2.redhat.com [10.72.8.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C16F11121315;
	Thu,  2 Mar 2023 03:11:28 +0000 (UTC)
Date: Thu, 2 Mar 2023 11:11:22 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: io-uring@vger.kernel.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org
Subject: Re: ublk-nbd: ublk-nbd is avaialbe
Message-ID: <ZAAT2noc/LqrVDIK@T590>
References: <Y8lSYBU9q5fjs7jS@T590>
 <Y/3RuWZKaYrTj/rT@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/3RuWZKaYrTj/rT@duo.ucw.cz>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <n1C7oFIvst.A.TGF.Q9BAkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2336
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZAAT2noc/LqrVDIK@T590
Resent-Date: Thu,  2 Mar 2023 04:00:16 +0000 (UTC)

On Tue, Feb 28, 2023 at 11:04:41AM +0100, Pavel Machek wrote:
> Hi!
> 
> > ublk-nbd[1] is available now.
> > 
> > Basically it is one nbd client, but totally implemented in userspace,
> > and wrt. current nbd-client in [2], the transmission phase is done
> > by linux block nbd driver.
> 
> There is reason nbd-client needs to be in kernel, and the reason is
> deadlocks during low memory situations.

Last time, the nbd memory deadlock is solved by the following approach
[1], which is used for ublk too.

Actually ublk can be thought as replacing nbd socket communication
with (much more lightweight & generic) uring_cmd, and move nbd socket
communication into userspace for ublk-nbd. Not see such way may cause
memory deadlock.

Also, ublk has built-in user recovery mechanism, killing deadlock user
daemon and recovering it can be the last straw, and the disk node won't
be gone away during the recovery.

So please provide some analysis or reproductions, otherwise I may have
to ignore your comments.


[1] https://lore.kernel.org/linux-fsdevel/20191112001900.9206-1-mchristi@redhat.com/

Thanks, 
Ming


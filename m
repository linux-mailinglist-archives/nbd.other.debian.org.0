Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC23C6B306
	for <lists+nbd@lfdr.de>; Tue, 18 Nov 2025 19:23:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5CDAC2054F; Tue, 18 Nov 2025 18:23:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 18 18:23:04 2025
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 608F42054D
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Nov 2025 18:22:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.097 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2qW0kJr7_N-a for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Nov 2025 18:22:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 306 seconds by postgrey-1.36 at bendel; Tue, 18 Nov 2025 18:22:50 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7D9792054B
	for <nbd@other.debian.org>; Tue, 18 Nov 2025 18:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763490165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNv0pqSHRfXuYShbyhGgq8zNuj162daZJfAUfy98etc=;
	b=dCkD+OskgOftpNuzmaXcqinStOLy59z/I/S1hQ3NwI5Ub5IOsxL2MEdPQlRbgKsqdsA3RE
	XAqvHIaxRE/Pf7HbEB++WOeL3qTeLpN4HdXCDHDvWWhWErqfqLyqJr0Tvhr2lZAGqWoRmp
	Aw2DVIMqsyMXOyMyZV+mxzBmnkRLYG4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-KnqTUGjFOuaMYKkdq5qUGA-1; Tue,
 18 Nov 2025 13:16:29 -0500
X-MC-Unique: KnqTUGjFOuaMYKkdq5qUGA-1
X-Mimecast-MFC-AGG-ID: KnqTUGjFOuaMYKkdq5qUGA_1763489787
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A1431800250;
	Tue, 18 Nov 2025 18:16:26 +0000 (UTC)
Received: from localhost (unknown [10.44.32.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BAB87195419F;
	Tue, 18 Nov 2025 18:16:24 +0000 (UTC)
Date: Tue, 18 Nov 2025 18:16:23 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Eric Dumazet <edumazet@google.com>, Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <eric.dumazet@gmail.com>,
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com,
	Mike Christie <mchristi@redhat.com>,
	Yu Kuai <yukuai1@huaweicloud.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
Message-ID: <20251118181623.GK1427@redhat.com>
References: <20250909132243.1327024-1-edumazet@google.com>
 <aRyzUc/WndKJBAz0@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRyzUc/WndKJBAz0@duo.ucw.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MPh1Cy4UA8K.A.RYAH.ImLHpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3474
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20251118181623.GK1427@redhat.com
Resent-Date: Tue, 18 Nov 2025 18:23:04 +0000 (UTC)

On Tue, Nov 18, 2025 at 06:56:33PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Recently, syzbot started to abuse NBD with all kinds of sockets.
> > 
> > Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
> > made sure the socket supported a shutdown() method.
> > 
> > Explicitely accept TCP and UNIX stream sockets.
> 
> Note that running nbd server and client on same machine is not safe in
> read-write mode. It may deadlock under low memory conditions.
> 
> Thus I'm not sure if we should accept UNIX sockets.

Both nbd-client and nbdkit have modes where they can mlock themselves
into RAM.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 235CDC80117
	for <lists+nbd@lfdr.de>; Mon, 24 Nov 2025 12:05:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F366920958; Mon, 24 Nov 2025 11:05:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 24 11:05:08 2025
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 990AC2094D
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Nov 2025 11:04:58 +0000 (UTC)
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
	with ESMTP id 7JhtTr9MPPOC for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Nov 2025 11:04:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 85E0220941
	for <nbd@other.debian.org>; Mon, 24 Nov 2025 11:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763982281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dj4aD9OHkRc+idg8PqslDsENxuTCxgqBYCZ+pFPNN/8=;
	b=D/l+DZ4PLk0Px/FQnN1NwOFFpgytAMdTH4F6C4VWpmLzhCiWYeksTtni0Z4/5GgmxsM3hx
	4s5uTxaSAJtnYz561Jss98VS800UgKtD9Hzj7Fiz+J8MPAyn+WPJtR0S3v/FhaccuLXoVg
	q6YU63uslDc/iw3ksQPRgj+hQ+annls=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-150-HY_Y74OnOtiQcY1b1TE0NA-1; Mon,
 24 Nov 2025 06:04:35 -0500
X-MC-Unique: HY_Y74OnOtiQcY1b1TE0NA-1
X-Mimecast-MFC-AGG-ID: HY_Y74OnOtiQcY1b1TE0NA_1763982272
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28B741956054;
	Mon, 24 Nov 2025 11:04:32 +0000 (UTC)
Received: from localhost (unknown [10.45.224.26])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2E0743003761;
	Mon, 24 Nov 2025 11:04:29 +0000 (UTC)
Date: Mon, 24 Nov 2025 11:04:28 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	Eric Dumazet <edumazet@google.com>,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <eric.dumazet@gmail.com>,
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com,
	Mike Christie <mchristi@redhat.com>,
	Yu Kuai <yukuai1@huaweicloud.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: Userland used in writeback path was Re: [PATCH] nbd: restrict
 sockets to TCP and UDP
Message-ID: <20251124110428.GA13479@redhat.com>
References: <20250909132243.1327024-1-edumazet@google.com>
 <aRyzUc/WndKJBAz0@duo.ucw.cz>
 <20251118181623.GK1427@redhat.com>
 <aR2JjR1yKHCCPalO@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR2JjR1yKHCCPalO@duo.ucw.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vUeXFHEKEaC.A.BreE.kvDJpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3476
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20251124110428.GA13479@redhat.com
Resent-Date: Mon, 24 Nov 2025 11:05:08 +0000 (UTC)

On Wed, Nov 19, 2025 at 10:10:37AM +0100, Pavel Machek wrote:
> On Tue 2025-11-18 18:16:23, Richard W.M. Jones wrote:
> > On Tue, Nov 18, 2025 at 06:56:33PM +0100, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > Recently, syzbot started to abuse NBD with all kinds of sockets.
> > > > 
> > > > Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
> > > > made sure the socket supported a shutdown() method.
> > > > 
> > > > Explicitely accept TCP and UNIX stream sockets.
> > > 
> > > Note that running nbd server and client on same machine is not safe in
> > > read-write mode. It may deadlock under low memory conditions.
> > > 
> > > Thus I'm not sure if we should accept UNIX sockets.
> > 
> > Both nbd-client and nbdkit have modes where they can mlock themselves
> > into RAM.
> 
> kernel needs memory. It issues write-back to get some.
> nbd-client does syscall. Maybe writing to storage?
> That syscall does kmalloc().
> That kmalloc now needs something like PF_MEMALLOC flag.
> 
> mlock() is not enough.

There are loads of use cases for NBD over a Unix domain socket that
have nothing to do with storage.  nbdkit supports all sorts of purely
virtual and remote devices.

Practically, we use this feature successfully all the time without any
issues, so we'd appreciate it not being broken over some very
theoretical concern that you haven't even been able to demonstrate in
a test case.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


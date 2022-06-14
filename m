Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47954B3AF
	for <lists+nbd@lfdr.de>; Tue, 14 Jun 2022 16:45:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 78DD0204B7; Tue, 14 Jun 2022 14:45:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 14 14:45:26 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8C5DB20489
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Jun 2022 14:45:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.337 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.147, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OilTjbQYGoU2 for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Jun 2022 14:45:11 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 402 seconds by postgrey-1.36 at bendel; Tue, 14 Jun 2022 14:45:11 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id B721C2045E
	for <nbd@other.debian.org>; Tue, 14 Jun 2022 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655217906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=V/MUQZbMJfC37CoT621ixpRROYdiM5Pubh/QFjQt96Y=;
	b=f3wzkjF0RxcZhD46XUb9Qtl58IrAuU6vDKzkGDxlCG+ld68itn7ftGhpyT7Q9kJ42NLYnO
	p5LjJRhKrNdLWgX8kva5CXtjFP8O9vNY9ANz9wpgl99M1mPBDLvDiFLu5aqeNoIdFukRz5
	TxAoYlZAIi/vSSxzJyfgfj5wpKDsbug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-LXNdoig4N-G4W_fd6lFF4w-1; Tue, 14 Jun 2022 10:38:21 -0400
X-MC-Unique: LXNdoig4N-G4W_fd6lFF4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2F5680418F;
	Tue, 14 Jun 2022 14:38:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DFF1C27E97;
	Tue, 14 Jun 2022 14:38:20 +0000 (UTC)
Date: Tue, 14 Jun 2022 15:38:19 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com,
	Nikolaus Rath <Nikolaus@rath.org>
Subject: Kernel driver I/O block size hinting
Message-ID: <20220614143819.GX8021@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PG6l7eKmY1N.A.e1.G8JqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2137
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220614143819.GX8021@redhat.com
Resent-Date: Tue, 14 Jun 2022 14:45:26 +0000 (UTC)

This is a follow-up to this thread:

  https://listman.redhat.com/archives/libguestfs/2022-June/thread.html#29210

about getting the kernel client (nbd.ko) to obey block size
constraints sent by the NBD server:

  https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#block-size-constraints

I was sent this very interesting design document about the original
intent behind the kernel's I/O limits:

  https://people.redhat.com/msnitzer/docs/io-limits.txt

There are four or five kernel block layer settings we could usefully
adjust, and there are three NBD block size constraints, and in my
opinion there's not a very clear mapping between them.  But I'll have
a go at what I think we should do.

	- - -

(1) Kernel physical_block_size & logical_block_size: The example given
is of a hard disk with 4K physical sectors (AF) which can nevertheless
emulate 512-byte sectors.  In this case you'd set physical_block_size
= 4K, logical_block_size = 512b.

Data structures (partition tables, etc) should be aligned to
physical_block_size to avoid unnecessary RMW cycles.  But the
fundamental until of I/O is logical_block_size.

Current behaviour of nbd.ko is that logical_block_size ==
physical_block_size == the nbd-client "-b" option (default: 512 bytes,
contradicting the documentation).

I think we should set logical_block_size == physical_block_size ==
MAX (512, NBD minimum block size constraint).

What should happen to the nbd-client -b option?


(2) Kernel minimum_io_size: The documentation says this is the
"preferred minimum unit for random I/O".

Current behaviour of nbd.ko is this is not set.

I think the NBD's preferred block size should map to minimum_io_size.


(3) Kernel optimal_io_size: The documentation says this is the
"[preferred] streaming I/O [size]".

Current behaviour of nbd.ko is this is not set.

NBD doesn't really have the concept of streaming vs random I/O, so we
could either ignore this or set it to the same value as
minimum_io_size.

I have a kernel patch allowing nbd-client to set both minimum_io_size
and optimal_io_size from userspace.


(4) Kernel blk_queue_max_hw_sectors: This is documented as: "set max
sectors for a request ... Enables a low level driver to set a hard
upper limit, max_hw_sectors, on the size of requests."

Current behaviour of nbd.ko is that we set this to 65536 (sectors?
blocks?), which for 512b sectors is 32M.

I think we could set this to MIN (32M, NBD maximum block size constraint),
converting the result to sectors.

	- - -

What do people think?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


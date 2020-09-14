Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C282691B3
	for <lists+nbd@lfdr.de>; Mon, 14 Sep 2020 18:36:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 75E3E2019E; Mon, 14 Sep 2020 16:36:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 14 16:36:28 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 56FED20140
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Sep 2020 16:36:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.332 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yO5gsnG4GtMX for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Sep 2020 16:36:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 5BC1920193
	for <nbd@other.debian.org>; Mon, 14 Sep 2020 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600101362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYam9Gp8b8CpLfr7Nu8SOE2u/4Ir9UNhKigXO5OLI+s=;
	b=EkCbSfFgZOec3nzEUY9crFX7fixOEH8hdynTtjr1qxoksb6lctIwA/vYQVnWbMJ75SFikT
	j7MuuGChqK0XFMM1N7cNAvgfYuKCoFnMoB0A4eMxesJa7dbVt8F+AABnRCezqEKL80vNRM
	ArOZZUkbZLPvhMVZLAREoYZEw+SbLOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-JYQlnukTO16Al49_Ob80Og-1; Mon, 14 Sep 2020 12:34:30 -0400
X-MC-Unique: JYQlnukTO16Al49_Ob80Og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18F0C18BE161;
	Mon, 14 Sep 2020 16:34:29 +0000 (UTC)
Received: from [10.3.113.68] (ovpn-113-68.phx2.redhat.com [10.3.113.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D976510023A5;
	Mon, 14 Sep 2020 16:34:28 +0000 (UTC)
Subject: Re: Mounting from multiple devices
To: Gregor Haas <gregorhaas1997@gmail.com>, nbd@other.debian.org
References: <CAMqWt3oixWoLuHUUxeRZDPAJGoF_M0sOZtVNfbiaaSq8KxjN0g@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <166c6457-0ad7-cb3d-d1d3-83c8e6de35a7@redhat.com>
Date: Mon, 14 Sep 2020 11:34:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMqWt3oixWoLuHUUxeRZDPAJGoF_M0sOZtVNfbiaaSq8KxjN0g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <v2woaFMMaQB.A.TqF.Mw5XfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/978
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/166c6457-0ad7-cb3d-d1d3-83c8e6de35a7@redhat.com
Resent-Date: Mon, 14 Sep 2020 16:36:28 +0000 (UTC)

On 9/14/20 11:03 AM, Gregor Haas wrote:
> Hi all,
> 
> First off, thank you for developing NBD. I've really been enjoying using it
> recently - accessing raw block devices over a network fits very well into
> my various use cases.
> 
> However, I've found some conflicting documentation about the _safety_ of
> accessing an exported block device from multiple clients. Notably, the
> sourceforge page (https://nbd.sourceforge.io/) states that "if someone has
> mounted NBD read/write, you must assure that no one else will have it
> mounted". In contrast, the documentation in the current Linux tree (
> https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/blockdev/nbd.rst)
> does omits this sentence, implying that it is okay for multiple clients to
> mount NBD read/write.
> 
> Let's say I have an ext4 filesystem on an NBD. Is it safe for me to mount
> this filesystem on multiple clients?

No.  It is not safe to mount an ext4 image from parallel clients.  Ever.

There are some clustered filesystems that are designed to be network 
safe, and can tolerate having multiple clients (whether one writer and 
multiple readers, or even multiple writers), because the writers take 
care to coordinate with each other before overwriting the same portion 
of the shared storage (in fact, that shared access is _how_ clustered 
filesystems are able to hand off control between which machine in the 
cluster is currently serving storage).  But most non-clustered 
filesystems (ext4 included) assume that they have exclusive control over 
the block storage, and you can cause massive corruption if that 
assumption doesn't hold because you mounted in parallel through a second 
user.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


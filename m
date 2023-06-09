Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587172A538
	for <lists+nbd@lfdr.de>; Fri,  9 Jun 2023 23:16:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 04DC52045E; Fri,  9 Jun 2023 21:16:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun  9 21:15:59 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG45,SARE_MSGID_LONG50,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 235AD20431
	for <lists-other-nbd@bendel.debian.org>; Fri,  9 Jun 2023 21:15:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.57 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Tl8fHVueHPDK for <lists-other-nbd@bendel.debian.org>;
	Fri,  9 Jun 2023 21:15:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 3A16B203F9
	for <nbd@other.debian.org>; Fri,  9 Jun 2023 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686345340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icD5wqAlS26HLhEs3T2niNzX/Jn3S0k3XAHdnLYbDtM=;
	b=PrkM8bVL03JV3RXPOBQRVlKNzkQijvmBBMwiZSJpdsepih/neUIDTYS8UR1FkLxgImVLM9
	dLWAGgClxiFIDLKfH6KAO0CCXohaef6Y0R0XOMYijHxg2TuXNEEMsIx6aj0e4Kp+ar8lpx
	4APszfJOm9QxldxtkhQGk7ympsjqCE0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-q8_tJfVmNIqnjIp7oNEHHw-1; Fri, 09 Jun 2023 17:15:39 -0400
X-MC-Unique: q8_tJfVmNIqnjIp7oNEHHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B2C53806626;
	Fri,  9 Jun 2023 21:15:39 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1625C10724;
	Fri,  9 Jun 2023 21:15:38 +0000 (UTC)
Date: Fri, 9 Jun 2023 16:15:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 08/22] block_status: Track 64-bit
 extents internally
Message-ID: <iezhroegvw2ouf57nq3rp73phq5fqgbz2agwwmhlieh5ezndx5@rdxgmrwtqhxg>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-9-eblake@redhat.com>
 <b3c08e33-24f0-2915-c9d1-0cbddf4cf4f0@redhat.com>
 <7lprewziqct35pgautpbuzgdrei7h6q36luam4uzkie445fjlm@sn7r4zl3m3pf>
MIME-Version: 1.0
In-Reply-To: <7lprewziqct35pgautpbuzgdrei7h6q36luam4uzkie445fjlm@sn7r4zl3m3pf>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4b1bY9vja-J.A.oEB.Pa5gkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2552
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/iezhroegvw2ouf57nq3rp73phq5fqgbz2agwwmhlieh5ezndx5@rdxgmrwtqhxg
Resent-Date: Fri,  9 Jun 2023 21:16:00 +0000 (UTC)

[fixing some of my editing errors]

On Fri, Jun 09, 2023 at 10:42:25AM -0500, Eric Blake wrote:
[...]
> 
> The tl;dr summary of the above discourse:
> There are two orthogonal communications going on:
> 
> libnbd <-> server  choice of NBD_REPLY_TYPE_BLOCK_STATUS{,_EXT}
> app <-> libnbd     choice of nbd_block_status() or nbd_block_status_64()
> 
> and all four combinations are easy to encounter when loading the .so
> for libnbd 1.18:
> 
> 32 x 32 (app compiled against libnbd 1.16 to server A)
> 64 x 32 (app compiled against libnbd 1.16 to server B)
> 32 x 64 (app compiled against libnbd 1.18 to server A)
> 64 x 64 (app compiled against libnbd 1.18 to server B)
> 
> and we want all four combinations to work insofar as possible.  32x32
> and 64x64 obviously work, as does 32x64 (widening the server's
> responses never fails); for 32x64 (using the 32-bit nbd_block_status()
> API to access a server's response through 64-bit
> NBD_REPLY_TYPE_BLOCK_STATUS), accessing a metacontext with large flags

for 64x32 (using the 32-bit nbd_block_status() to access a server's
response through 64-bit NBD_REPLY_TYPE_BLOCK_STATUS_EXT),

> changes from fail early to fail late; and accessing a metacontext with
> 32-bit flags but now potential 64-bit lengths obeys overall NBD
> semantics that a block status response can be truncated as long as it
> makes progress (the app shouldn't care whether it was the server or
> libnbd that did the truncation).
>
[...]
> 
> It is indeed a bug if a server replies with
> NBD_REPLY_TYPE_BLOCK_STATUS_EXT for a client that did not request
> extended headers.  But it is also a bug if a server replise with

replies

> NBD_REPLY_TYPE_BLOCK_STATUS for a client that did request extended
> headers, even if the reply does not need more than 32 bits for either
> the length or the flags.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


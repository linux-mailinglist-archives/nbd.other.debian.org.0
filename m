Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC893C894
	for <lists+nbd@lfdr.de>; Thu, 25 Jul 2024 21:02:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E861B20D04; Thu, 25 Jul 2024 19:02:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 25 19:02:29 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C8E420CEB
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Jul 2024 19:02:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.58 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id L0coIy3W9yoo for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Jul 2024 19:02:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id BF83820CE8
	for <nbd@other.debian.org>; Thu, 25 Jul 2024 19:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721934130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s1EgtC5Zyd0+M7dW8BgWSZUgLMCFLsbULmk/eMJ3Z2o=;
	b=B6Lm3u0yMokS8cxmeE///SN/tgQOQBJdZcP4/9AhllwQC/sWjXsKexOc+ApbqVnm/SpKvh
	TTjSVCHrsXI6QMEpFm4jYjHZGDxsLYV6qasChEOiKBA7NMW97i5lXQSSgT/rSwoeUFvGhD
	GZ1RAd+hzHZkXPQ6gTvtKB6WTc8wM9o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-c6HQHpleMdWs_xEVZUrgrQ-1; Thu,
 25 Jul 2024 14:30:42 -0400
X-MC-Unique: c6HQHpleMdWs_xEVZUrgrQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 12AE5195608A;
	Thu, 25 Jul 2024 18:30:41 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.72])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F8241955D42;
	Thu, 25 Jul 2024 18:30:38 +0000 (UTC)
Date: Thu, 25 Jul 2024 13:30:35 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbd: add support for rotational devices
Message-ID: <xdq3z4oosh2l4hzlkgxsfbqza6z2q2c2zyznmo24rtt6svlixr@c2w2tpzqlzbp>
References: <20240725164536.1275851-1-w@uter.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725164536.1275851-1-w@uter.be>
User-Agent: NeoMutt/20240425
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Nn3-uFIyMzI.A.OlVE.FFqomB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3105
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/xdq3z4oosh2l4hzlkgxsfbqza6z2q2c2zyznmo24rtt6svlixr@c2w2tpzqlzbp
Resent-Date: Thu, 25 Jul 2024 19:02:29 +0000 (UTC)

On Thu, Jul 25, 2024 at 06:45:36PM GMT, Wouter Verhelst wrote:
> The NBD protocol defines the flag NBD_FLAG_ROTATIONAL to flag that the
> export in use should be treated as a rotational device.
> 
> Add support for that flag to the kernel driver.
> 
> Signed-off-by: Wouter Verhelst <w@uter.be>
> ---
>  drivers/block/nbd.c      | 3 +++
>  include/uapi/linux/nbd.h | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

For what it's worth, the nbdkit project recently made it possible to
aad a filter on top of any existing NBD server to change the setting
of the rotational bit[1], as well as a filter to intentionally
simulate delays of a rotational device[2], in order to experiment with
how much impact changing the bit can have when it is not ignored.

[1] https://libguestfs.org/nbdkit-rotational-filter.1.html
[2] https://libguestfs.org/nbdkit-spinning-filter.1.html

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


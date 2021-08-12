Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54F3EA7A5
	for <lists+nbd@lfdr.de>; Thu, 12 Aug 2021 17:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7D5DD20390; Thu, 12 Aug 2021 15:35:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 12 15:35:58 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DF9E82030F
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Aug 2021 15:35:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.355 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pA3jQTDEYcbM for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Aug 2021 15:35:46 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 2EBF82024F
	for <nbd@other.debian.org>; Thu, 12 Aug 2021 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628782541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NHxcJB6Dx8/bsst5x+A7CZjcxgMXd7//qJ3xADNRAT8=;
	b=iFbR0uGGSMFaolOPiftR0209zIzjSrJtXusWWq9vCSOS9fp65AdVT+wwIIje+HpzZBFgBj
	um0SfuKXwhd5kZjEjqvFLG+yvIKSoSljgI28VpWT5GE6Yr2wd8pePC9dfWB6ADU4a2VXf+
	zKDTnwv8OfJxlCqR/MeKjpqz57oZQAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-oLMqJgz-PaSewlFGmDQ1nA-1; Thu, 12 Aug 2021 11:35:37 -0400
X-MC-Unique: oLMqJgz-PaSewlFGmDQ1nA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A077E100A972;
	Thu, 12 Aug 2021 15:35:28 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFD9783BF8;
	Thu, 12 Aug 2021 15:35:27 +0000 (UTC)
Date: Thu, 12 Aug 2021 10:35:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@lst.de,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+9937dc42271cd87d4b98@syzkaller.appspotmail.com
Subject: Re: [PATCH] block: nbd: add sanity check for first_minor
Message-ID: <20210812153525.hlged76ivhqtffyg@redhat.com>
References: <20210812091501.22648-1-paskripkin@gmail.com>
 <7f9a6877-12d9-0177-d09a-6522e5a557ec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f9a6877-12d9-0177-d09a-6522e5a557ec@gmail.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ti2LZzktvZ.A.ruD.e_TFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1278
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210812153525.hlged76ivhqtffyg@redhat.com
Resent-Date: Thu, 12 Aug 2021 15:35:58 +0000 (UTC)

On Thu, Aug 12, 2021 at 12:42:38PM +0300, Pavel Skripkin wrote:
> 
> Fun thing: I got a reply to this email from
> nsd-public@police.gov.hk, which is Hong Kong Police office email. Does
> anyone know what is going on? :) It's a bit scary...

You are not alone.  Apparently, someone subscribed that address to the
nbd@other.debian.org list and it is auto-responding to every message
it receives; hopefully, a list administrator (I am not one) will be
willing to forcefully unsubscribe that address.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8EF8BFF8D
	for <lists+nbd@lfdr.de>; Wed,  8 May 2024 15:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0AA0F203E8; Wed,  8 May 2024 13:54:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May  8 13:54:58 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A6007204F8
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 May 2024 13:54:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.809 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.23, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id v8NSmqjN08Vi for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 May 2024 13:54:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 1A52E204C1
	for <nbd@other.debian.org>; Wed,  8 May 2024 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715176477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOHk82d8rK+Nd0nSzdhN9cznYyqUDqImOLujWM/kyro=;
	b=MhjEqHwedR+M0JS8ZM+2I4EiUjOSSOBheuyEvKOCJeOo5oUv5um+vqXenLQFPhLXh51mai
	tdearonalpdmf8kTGl0ZLip9tcFkbSRkTAKlwJaiurCRhwZlpnEW7XFpFvN+dtzstaNI0P
	en/Q8hmLGYNcYpZw2U/7OilYfpPdtkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-muPnWhoNN4OPxvdF_wIZsA-1; Wed, 08 May 2024 09:54:34 -0400
X-MC-Unique: muPnWhoNN4OPxvdF_wIZsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEA12802314;
	Wed,  8 May 2024 13:54:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.187])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD6771C066AC;
	Wed,  8 May 2024 13:54:32 +0000 (UTC)
Date: Wed, 8 May 2024 08:54:31 -0500
From: Eric Blake <eblake@redhat.com>
To: Lars Rohwedder <roker@pep-project.org>
Cc: nbd@other.debian.org
Subject: Re: stat().st_size and lseek() should return block device size.
Message-ID: <qhqlm7vvuy2xompeltabqmxptnxjtuovfiosdsrxtemj5w7eho@e2rew6fmpdbq>
References: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
 <paxaxd3fxa2nhbp2ldllolydeibtv7dsonti67cxvuz27hmtcf@6is65mo7ar3y>
 <fuy47nk42oe5jffsojcfykpdik7ld4mlp7gdwi52siopozwqa6@r7fhrfoljbs7>
 <3dbbc6e2-bea0-4af6-8149-2261dc684ecc@pep-project.org>
MIME-Version: 1.0
In-Reply-To: <3dbbc6e2-bea0-4af6-8149-2261dc684ecc@pep-project.org>
User-Agent: NeoMutt/20240201
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <54CrMfvHttJ.A.s0H.yQ4OmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2806
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/qhqlm7vvuy2xompeltabqmxptnxjtuovfiosdsrxtemj5w7eho@e2rew6fmpdbq
Resent-Date: Wed,  8 May 2024 13:54:59 +0000 (UTC)

On Tue, May 07, 2024 at 07:22:57PM +0200, Lars Rohwedder wrote:
> I'd prefer when both stat().st_size and lseek() just return the "number
> of bytes" (that you can read out until you get EOF) of that block
> device.

That would be nice in an ideal world, but it does not match what the
Linux kernel currently does (0 for st_size, capacity for lseek) or the
BSD heritage (0 for both st_size and lseek), which differs still from
Solaris (capacity for st_size and lseek).

> Anything else is just awkward and does not make any sense to me
> (from the programmer's point of view), even though POSIX might not
> require it for block devices.

And that's why we're having this conversation in the first place.

> 
> And for NBD this size is always known to the nbd-server: Either size of
> served file, sum of the sizes of all chunks ("multifile") or configured
> size (for "treefiles").

Maybe what it boils down to is whether nbd-server is intended to serve
block devices.  Right now, it does what you want with regular files,
but gets the size of block devices wrong.

> 
> So why not just give that information to the clients easily?
> 
> Just my 2 ct,
> 
> 	Lars R.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


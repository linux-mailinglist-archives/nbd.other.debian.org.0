Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B44015954B
	for <lists+nbd@lfdr.de>; Tue, 11 Feb 2020 17:46:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 408F4204FB; Tue, 11 Feb 2020 16:46:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 11 16:46:01 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7B6320503
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Feb 2020 16:45:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MOJkQhO1UYiG for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Feb 2020 16:45:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id 3352A2038E
	for <nbd@other.debian.org>; Tue, 11 Feb 2020 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581439544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjtWNTWWb7kytgv3hB1zN6w57RvJJ+Lgy0IQguAV/To=;
	b=goRqFKsKWrGKCijiaR25Emq4xAIlCQFX1BRixylCDYkEiSU+BpAyeS+GleQTkz+V3JEaYO
	/MfHNcrJHXwta0NgE6vhC/03yqhx+mDUR/2/zgDMS4mphIGBwKp3ci8l7U2Hg5E46InTFU
	Zd9BzsIyv3EQseB6AxuCrZUaSEGL6ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-XGvSaIvdPWO_eYUFVG1C5w-1; Tue, 11 Feb 2020 11:45:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 455C21B18BC0;
	Tue, 11 Feb 2020 16:45:32 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E825E60BF1;
	Tue, 11 Feb 2020 16:45:31 +0000 (UTC)
Subject: Re: [PATCH] doc/proto: drop max-block restriction for data-less
 commands
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 nbd@other.debian.org
Cc: den@openvz.org
References: <20200204120257.3685-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7ad1f7eb-14da-6fb0-309c-465208474223@redhat.com>
Date: Tue, 11 Feb 2020 10:45:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204120257.3685-1-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: XGvSaIvdPWO_eYUFVG1C5w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PL3ZON1SDeF.A.Sn.JptQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/814
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7ad1f7eb-14da-6fb0-309c-465208474223@redhat.com
Resent-Date: Tue, 11 Feb 2020 16:46:01 +0000 (UTC)

On 2/4/20 6:02 AM, Vladimir Sementsov-Ogievskiy wrote:
> max-block restriction make sense for NBD_CMD_WRITE and NBD_CMD_READ to
> avoid big data transfer and long io operations at server side.
> NBD_CMD_WRITE_ZEROES still may be realized on server through direct
> writing zeroes, which may lead to long operation and huge allocation
> and should be restricted by max-block.
> Same for NBD_CMD_CACHE: long operation / big allocation.
> 
> Still, NBD_CMD_TRIM, NBD_CMD_BLOCK_STATUS and NBD_CMD_WRITE_ZEROES with
> NBD_CMD_FLAG_FAST_ZERO set are over-restricted by it. So, for better
> performance, drop these restrictions.
> 
> Note, that Qemu nbd server already works accordingly to this patch: it
> doesn't check the restriction for NBD_CMD_TRIM, NBD_CMD_BLOCK_STATUS
> and NBD_CMD_WRITE_ZEROES.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> RFC question: hmm, Qemu nbd doesn't check restriction for WRITE_ZEROES
> at all, even without NBD_CMD_FLAG_FAST_ZERO flag.

That's actually a good question.  I looked today at relaxing qemu as a 
client to take advantage of this change as committed, and it's a bit 
easier to relax if we can guarantee that the server handles all 
WRITE_ZEROES rather than just the FAST_ZERO requests with unlimited size 
(qemu automatically fragments large zero requests at the block layer; 
but if I make qemu's client code conditional on whether a FAST_ZERO is 
being requested, then block/nbd.c has to do report a larger max zero in 
nbd_refresh_limits() and fragmenting itself on non-fast requests, 
instead of getting pre-fragmented requests from the block layer).

But, as you say, with fast zeroes, the server already has to be aware on 
what qualifies as fast (only newer servers support it), while with older 
servers, you don't get FAST_ZERO.  At the same time, older servers don't 
know about the newer relaxed requirement, so clients STILL have to be 
prepared for EINVAL failures when an older server rejects what it 
considers to be oversized requests, regardless of whether the newer 
server handles that larger size.  So a client that wants to be portable 
to multiple servers HAS to be prepared for oversized requests to fail, 
and to consider scaling back to max block size rather than completely 
assuming the operation is not going to work.

> 
> So, we probably could go further, and allow big WRITE_ZEROES without
> this flag..
> 
> Or may be change s/MUST NOT/SHOULD NOT/ for this case..

Or I could follow through with my idea of letting clients and servers 
handshake actual limits with additional NBD_INFO_* during NBD_OPT_GO 
(now that I just posted my NBD_INFO_INIT_STATE patches, I'm getting 
closer to that as my next project).  The benefit of an advertised size 
is that clients won't have to guess if an oversized request will fail 
with EINVAL on an older server.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


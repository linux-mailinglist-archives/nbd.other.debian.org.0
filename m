Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7A48E03D
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 23:25:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 01A2520330; Thu, 13 Jan 2022 22:25:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 22:25:31 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C88C720282
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 22:25:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.927 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	WORD_WITHOUT_VOWELS=1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yarhntZH451F for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 22:25:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id A41AC20271
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 22:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642112713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C0nfgkoGjHF5VA8BIPM4+AbRz6g8oa8DRpD08DPhk7U=;
	b=IJiD0GdaGwMSi5RSEBrfQsIkgvurDP/s9L3ZglW+3TZh5/nR+L+WKErrH3h6kITiVRD11M
	LtD421B3FWyBnZo5O9vmyITPsmp+7B+TgUJOt0qHeGuYM10hMig0avJq+Pfm+j8q1OHGfp
	7hhQr6uhEjftqqCJm5ziZSu9W5c/pjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473--z105CKXPFeq8iKoZMIboQ-1; Thu, 13 Jan 2022 17:25:06 -0500
X-MC-Unique: -z105CKXPFeq8iKoZMIboQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F58C1083F60;
	Thu, 13 Jan 2022 22:25:05 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.226])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C3C95F4E1;
	Thu, 13 Jan 2022 22:25:04 +0000 (UTC)
Date: Thu, 13 Jan 2022 16:25:02 -0600
From: Eric Blake <eblake@redhat.com>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org, Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: Re: [PATCH 2/7] nbd-server, nbd-trdump: Add support for logging
 actual data
Message-ID: <20220113222502.5sqb2asbc3tgsetm@redhat.com>
References: <20220113073407.4742-1-manfred@colorfullife.com>
 <20220113073407.4742-3-manfred@colorfullife.com>
MIME-Version: 1.0
In-Reply-To: <20220113073407.4742-3-manfred@colorfullife.com>
User-Agent: NeoMutt/20211029-182-90c72c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wafiue-pRqJ.A.3JD.bbK4hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1685
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113222502.5sqb2asbc3tgsetm@redhat.com
Resent-Date: Thu, 13 Jan 2022 22:25:32 +0000 (UTC)

On Thu, Jan 13, 2022 at 08:34:02AM +0100, Manfred Spraul wrote:
> The datalog generated by nbd-server contains only the requests
> received by the server, not the actual data to be written.
> 
> This patch adds support to write the actual data.
> 
> As details:
> - It is configurable, the default behavior is not changed.
> - It adds a NBD_CMD_FLAG_DATALOG flag: I think this is the simplest
>   way to mark that actual data wil follow in the log.

New protocol flags to be sent over the wire need to be documented in
doc/proto.md.  Is your intent that a client can send this flag, or
that the flag is only used in the data log but never sent by a
compliant client and never seen by the server?  If the former, then we
also need to figure out the best way for client and server to
negotiate when it is safe for the client to send the flag.

>   As clients must not use a feature that is not exposed by the server,
>   and as the server fails commands with unexpected flags, the approach
>   should be safe. Obviously, if the protocol is extended so that 14
>   flags are needed, then it will bite us.

It sounds like your intent is to just use the new flag only in the
log, and not in the NBD protocol itself.  Seems like it might work.

> - It is an incompatible change: Current nbd-trdump utilities
>   will just fail/produce bad output when called with a new
>   log file, without a proper error message.
> - The change does not add a header to the datalog. I.e.:
>   If we sometime in the future extend the log again, it will
>   be again an incompatible change without a proper error
>   message
> - nbd-trdump supports to dump also the messages sent by the
>   server. Unfortunately, the current server does not log
>   the sent messages. This change does not fix this.
> 
> Known bugs:
> Locking is missing. If multiple clients connect, then the data log
> will be unusable.
> 
> Plan: Use a named posix semaphore (sem_open()).
> Given the multi-process, multi-thread model, with a single fd shared
> by everyone, this is probably simpler than trying to find a reliable
> flock()/fcntl()/pthread_mutex_lock() combination.
> Alternative: shm_open()+a shared pthread_mutex.
> 
> Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
> ---
>  nbd-helper.h |  4 ++++
>  nbd-server.c | 20 +++++++++++++++++++-
>  nbd-trdump.c | 13 +++++++++++++
>  nbdsrv.h     |  1 +
>  4 files changed, 37 insertions(+), 1 deletion(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


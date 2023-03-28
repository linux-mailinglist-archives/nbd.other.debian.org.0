Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ECE6CC211
	for <lists+nbd@lfdr.de>; Tue, 28 Mar 2023 16:31:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68A3F204D7; Tue, 28 Mar 2023 14:31:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 28 14:31:46 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MONEY,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C2749204E5
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Mar 2023 14:31:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.063 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MONEY=0.5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QI5R-phRH45K for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Mar 2023 14:31:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 411C1204D7
	for <nbd@other.debian.org>; Tue, 28 Mar 2023 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680013883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JA4YbuQ/GI6fi+dUFUjZJ39bhLpwwfGIdAJA3tFjlUQ=;
	b=f4KbR2b40cNiD+VRBeUaO6N1vZal4xi4LU1qH/EdRSjyTH/bZRQ/6QZqa50lrdJmtnZpl0
	3oM0a/Xbv1UvuXsepEyYULFpQhsrPmVKIjvXHMhayn1T4zW7c3bAyWnqd40ahSuZXBsYnv
	SYXiKVXKNeeLl7wDXBizmGjH6aV5kRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-AeaGFadbPQemcjCZm27rRQ-1; Tue, 28 Mar 2023 10:31:20 -0400
X-MC-Unique: AeaGFadbPQemcjCZm27rRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD316185A794;
	Tue, 28 Mar 2023 14:31:19 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.173])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8984FC15BA0;
	Tue, 28 Mar 2023 14:31:19 +0000 (UTC)
Date: Tue, 28 Mar 2023 09:31:17 -0500
From: Eric Blake <eblake@redhat.com>
To: w@uter.be
Cc: nbd@other.debian.org
Subject: Re: [PATCH 4/4] Implement negotiation of structured replies
Message-ID: <pfehs7s7kxxpgy4grneuoeokdqdikxp2gz324am3rupi7j62tq@svbbeag6sgzv>
References: <20230311130705.253855-1-w@uter.be>
 <20230311130705.253855-5-w@uter.be>
MIME-Version: 1.0
In-Reply-To: <20230311130705.253855-5-w@uter.be>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nctZIfQ5NjB.A.hP.SpvIkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2414
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/pfehs7s7kxxpgy4grneuoeokdqdikxp2gz324am3rupi7j62tq@svbbeag6sgzv
Resent-Date: Tue, 28 Mar 2023 14:31:46 +0000 (UTC)

On Sat, Mar 11, 2023 at 03:07:05PM +0200, w@uter.be wrote:
> From: Wouter Verhelst <w@uter.be>
> 
> This should make it possible for us to use structured replies!
> 
> Signed-off-by: Wouter Verhelst <w@uter.be>
> ---
>  cliserv.h    | 13 +++++++------
>  nbd-server.c | 28 ++++++++++++++++++++++++++++
>  nbd.h        |  1 +
>  3 files changed, 36 insertions(+), 6 deletions(-)
> 

> +/**
> +  * Handle an NBD_OPT_STRUCTURED_REPLY message
> +  */
> +static void handle_structured_reply(CLIENT *client, uint32_t opt, GArray *servers, uint32_t cflags) {
> +	uint32_t len;
> +	int i;
> +
> +	socket_read(client, &len, sizeof(len));
> +	len = ntohl(len);
> +	if(len) {
> +		send_reply(client, opt, NBD_REP_ERR_INVALID, -1, "NBD_OPT_STRUCTURED_REPLY with nonzero data length is not a valid request");
> +		char buf[1024];
> +		consume(client, len, buf, sizeof buf);
> +	}
> +	if(client->clientflags & F_STRUCTURED) {
> +		send_reply(client, opt, NBD_REP_ERR_INVALID, -1, "NBD_OPT_STRUCTURED_REPLY has already been called");
> +	}

Missing an early 'return;', results in the server sending an
unexpected ACK after the error which gets the client out of sync.
Easy proof-of-concept, with libnbd 1.15.5 or newer:

$ ./nbd-server -d -r 10809 $PWD/README.md
$ nbdsh --opt-mode
nbd> h.connect_uri('nbd://localhost')
nbd> h.opt_structured_reply()    # sees the error; ack stays queued
False
nbd> h.opt_structured_reply()    # sees the stale ack; new error and ack queued
True
nbd> h.opt_structured_reply()    # sees the stale error; another error and ack queued
True
nbd> h.opt_go()                  # sees the stale ack; then queue is unexpected and client dies
Traceback (most recent call last):
  File "<console>", line 1, in <module>
  File "/home/eblake/libnbd/python/nbd.py", line 1072, in opt_go
    return libnbdmod.opt_go(self._o)
           ^^^^^^^^^^^^^^^^^^^^^^^^^
nbd.Error: nbd_opt_go: server replied with error to opt_go request: Transport endpoint is not connected (ENOTCONN)

With the return added,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


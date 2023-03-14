Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4036B9A25
	for <lists+nbd@lfdr.de>; Tue, 14 Mar 2023 16:45:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C9AC9204DF; Tue, 14 Mar 2023 15:45:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 14 15:45:27 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,ROLEX,
	WORD_WITHOUT_VOWELS autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3743F204DB
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Mar 2023 15:45:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, ROLEX=3, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ividVc_5C_9o for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Mar 2023 15:45:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 73204204DD
	for <nbd@other.debian.org>; Tue, 14 Mar 2023 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678808702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zyfzi/wPKtvaR/atq/OdqHpQf8x229Gci67ZS+cqFDY=;
	b=XV2YVLbjVr9JC1jp/tlJcvogScrfYlczHAfaOcJmqsEo3uARzHCcoPi87SoN15hsDCqbnk
	YvLQcNZrI+KPY6J0YaXh8LePxBOip7ZRowc/w4av8K3lMihARRiUfe0QfPcjUGcbxbWKl/
	1QAGrM2u8Y9nGhs9S9j4SpvdqKuv5vY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-qm1vWFVXMJu5ZPohxBw7cQ-1; Tue, 14 Mar 2023 11:45:01 -0400
X-MC-Unique: qm1vWFVXMJu5ZPohxBw7cQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E63B21802D4C;
	Tue, 14 Mar 2023 15:44:56 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F02E2166B2B;
	Tue, 14 Mar 2023 15:44:56 +0000 (UTC)
Date: Tue, 14 Mar 2023 10:44:54 -0500
From: Eric Blake <eblake@redhat.com>
To: w@uter.be
Cc: nbd@other.debian.org
Subject: Re: [PATCH 1/4] Refactor request handling
Message-ID: <20230314154454.32a7dbz2jc5rmxms@redhat.com>
References: <20230311130705.253855-1-w@uter.be>
 <20230311130705.253855-2-w@uter.be>
MIME-Version: 1.0
In-Reply-To: <20230311130705.253855-2-w@uter.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5xDATJAZCGE.A.k-G.XaJEkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2390
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230314154454.32a7dbz2jc5rmxms@redhat.com
Resent-Date: Tue, 14 Mar 2023 15:45:27 +0000 (UTC)

On Sat, Mar 11, 2023 at 03:07:02PM +0200, w@uter.be wrote:
> From: Wouter Verhelst <w@uter.be>
> 
> Currently, the state of a request is stored on the stack, with the reply
> being built in a buffer which is sent out at the very end of the
> 'handle_normal_read' function.
> 
> This makes implementing structured replies complicated, as for those we
> may want to sometimes send a reply chunk before that point.
> 
> Thus, refactor request handling such that we no longer depend on the
> stack for sending out things.
> 
> Signed-off-by: Wouter Verhelst <w@uter.be>
> ---
>  nbd-server.c | 144 +++++++++++++++++++++++++++++++++++----------------
>  nbdsrv.h     |   8 +++
>  2 files changed, 106 insertions(+), 46 deletions(-)

>  /**
>   * Read an amount of bytes at a given offset from the right file. This
>   * abstracts the read-side of the multiple files option.
> @@ -1310,15 +1354,20 @@ ssize_t rawexpread(off_t a, char *buf, size_t len, CLIENT *client) {
>   * Call rawexpread repeatedly until all data has been read.
>   * @return 0 on success, nonzero on failure
>   **/
> -int rawexpread_fully(off_t a, char *buf, size_t len, CLIENT *client) {
> +int rawexpread_fully(READ_CTX *ctx, CLIENT *client) {
>  	ssize_t ret=0;
>  
> -	while(len > 0 && (ret=rawexpread(a, buf, len, client)) > 0 ) {
> -		a += ret;
> -		buf += ret;
> -		len -= ret;
> +	char *buf;
> +
> +	while(ctx->current_len > 0) {
> +		buf = find_read_buf(ctx);
> +		if((ret = rawexpread((off_t)ctx->req->from + (off_t)ctx->current_offset, buf, ctx->current_len, client)) < 0) {
> +			return ret;
> +		}
> +		ctx->current_offset += ret;
> +		ctx->current_len -= ret;
>  	}
> -	return (ret < 0 || len != 0);

The old code looped until an error was detected or a short read occurs
(ret == 0, len != 0).

> +	return (ret < 0 || ctx->current_len != 0);

But the new code loops only until ctx->current_len is 0 (with early
exit on read error), making the right side of the || dead code, and
making the loop itself busy-loop on a persistently short read.
Quickest fix would be inserting

    if (ret == 0) break;

after the if((ret = ...)) condition, and leaving the || in the return
untouched.

...
> +++ b/nbdsrv.h
> @@ -89,6 +89,14 @@ typedef struct {
>  	off_t startoff;   /**< starting offset of this file */
>  } FILE_INFO;
>  
> +typedef struct {
> +	struct nbd_request *req;
> +	char *buf;
> +	size_t buflen;
> +	size_t current_offset;

Should this be an off_t to begin with, or do we not care about 32-bit platforms?

> +	uint32_t current_len;
> +} READ_CTX;
> +
>  /* Constants and macros */
>  
>  /**
> -- 
> 2.39.2
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


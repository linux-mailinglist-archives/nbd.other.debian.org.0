Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29A712A9A
	for <lists+nbd@lfdr.de>; Fri, 26 May 2023 18:27:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2C4962069E; Fri, 26 May 2023 16:27:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 26 16:27:12 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4804920685
	for <lists-other-nbd@bendel.debian.org>; Fri, 26 May 2023 16:09:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.351 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.161, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z68FdkuXTTZS for <lists-other-nbd@bendel.debian.org>;
	Fri, 26 May 2023 16:09:10 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 47AE720511
	for <nbd@other.debian.org>; Fri, 26 May 2023 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685117345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bue1davh24Q9zf0jDnrAskcNu/oWzVto8RAASzBLT+I=;
	b=INiA4vIYEhbvvNW6X/zWthqXa0TY5prbuuaIR+vbOpPJRJUip4vuqKtBEnkr3DP3Ixaa7W
	bYzzfNcUu/GRKbieYLsX/+H2JSaljjg7k312IrZqvNqQpgXHPqL8XCBFEReCQnk5ZTZg/D
	ITZNOw53/fB+Phuv2RB+aTgPrLJxrOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-UTaaJN2SMbylccd2ru6lUA-1; Fri, 26 May 2023 12:09:03 -0400
X-MC-Unique: UTaaJN2SMbylccd2ru6lUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE02E185A7AA;
	Fri, 26 May 2023 16:09:02 +0000 (UTC)
Received: from [10.39.193.100] (unknown [10.39.193.100])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C29140C125C;
	Fri, 26 May 2023 16:09:01 +0000 (UTC)
Message-ID: <87df235a-0e5f-8c36-bff1-15910bc3947c@redhat.com>
Date: Fri, 26 May 2023 18:09:00 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 02/22] internal: Refactor layout of
 replies in sbuf
From: Laszlo Ersek <lersek@redhat.com>
To: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Cc: qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-3-eblake@redhat.com>
 <1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com>
In-Reply-To: <1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1tfDNRGBp5B.A.zxD.g3NckB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2504
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/87df235a-0e5f-8c36-bff1-15910bc3947c@redhat.com
Resent-Date: Fri, 26 May 2023 16:27:12 +0000 (UTC)

On 5/26/23 17:53, Laszlo Ersek wrote:

> Optimally, the simple reply and the structured reply should look like
> this:
> 
>   struct nbd_reply_header {
>     uint32_t magic;
>     union {
>       struct {
>         uint32_t error;
>         uint64_t handle;
>       } simple;
>       struct {
>         uint16_t flags;
>         uint16_t type;
>         uint64_t handle;
>         uint32_t length;
>       } structured;
>     } magic_specific;
>   };
> 
> and we should have separate automaton states for reading
> "magic_specific.simple" and "magic_specific.structured".
> 
> In REPLY.START, we should only read "magic".
> 
> We should have a sepate state called REPLY.SIMPLE_REPLY.START, for
> reading "magic_specific.simple".
> 
> In REPLY.STRUCTURED_REPLY.START, we should point h->rbuf at
> "magic_specific.structured", and read "sizeof magic_specific.structured"
> bytes.

This (pre-patch) part:

  /* NB: This works for both simple and structured replies because the
   * handle (our cookie) is stored at the same offset.
   */
  [...]
  cookie = be64toh (h->sbuf.simple_reply.handle);

is disconcerting as well. I think it's well-defined C, but a hack
nonetheless.

IMO, unions are justified for two purposes:

- deliberately reinterpreting one object representation as another

- saving space, when at most one of N objects is expected to exist at
any given time.

Both of those uses follow from intentional elements of a design. But the
fact that "handle" is at the same offset in both "simple" and
"structured" is totally arbitrary. IMO this is a hack.

Laszlo


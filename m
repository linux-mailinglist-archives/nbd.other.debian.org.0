Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 71391553B4B
	for <lists+nbd@lfdr.de>; Tue, 21 Jun 2022 22:15:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4F52F204CC; Tue, 21 Jun 2022 20:15:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 21 20:15:39 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FUZZY_OFFERS,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E6231203C1
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Jun 2022 20:15:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.937 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.147, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1LpX8x7R66AO for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Jun 2022 20:15:27 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id D1278203C0
	for <nbd@other.debian.org>; Tue, 21 Jun 2022 20:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655842521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rtHp2gewFI7rtID4QIa/d9h0zR1JPTGblay2Xgxj1EU=;
	b=HKxS+urr0BTi10DFjfcgIbhUWDek8AIBvSSG2JkQu7+kgkihS+9DpXowQyBLUY2K2db78a
	9cJt1RzrHmFkEQInwwMrf69SsyPgX7UCbmwFpaQn1BFd20OHlyikztnpCJrT2Q8odXeyDC
	S2yqudrx87xFAB1Duun2ajEI8S2j7Wk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-GbS-HxxhO4Co_sfOqvfYAQ-1; Tue, 21 Jun 2022 15:44:22 -0400
X-MC-Unique: GbS-HxxhO4Co_sfOqvfYAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A505E185A7BA;
	Tue, 21 Jun 2022 19:44:21 +0000 (UTC)
Received: from redhat.com (unknown [10.2.18.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB7F82166B26;
	Tue, 21 Jun 2022 19:44:20 +0000 (UTC)
Date: Tue, 21 Jun 2022 14:44:19 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, prasanna.kalever@redhat.com,
	xiubli@redhat.com, ming.lei@redhat.com, nbd@other.debian.org
Subject: Re: [PATCH nbd-client] client: Request NBD_INFO_BLOCK_SIZE and set
 constraints in the kernel
Message-ID: <20220621194419.76c652ft7kuu6zc6@redhat.com>
References: <20220616112942.3222708-1-rjones@redhat.com>
 <20220616112942.3222708-2-rjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220616112942.3222708-2-rjones@redhat.com>
User-Agent: NeoMutt/20220429-125-d07217
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UKIsI23h3.A.ybB.rbisiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2171
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220621194419.76c652ft7kuu6zc6@redhat.com
Resent-Date: Tue, 21 Jun 2022 20:15:39 +0000 (UTC)

On Thu, Jun 16, 2022 at 12:29:42PM +0100, Richard W.M. Jones wrote:
> NBD servers may advertise their minimum, preferred and maximum block
> size constraints.  The constraints do not map well to what the kernel
> expects, so see this design document for the mapping used here:
> https://lists.debian.org/nbd/2022/06/msg00022.html
> 
> This patch only does the smallest change to read these constraints
> from the server and map the preferred block size to kernel hints
> minimum_io_size and optimal_io_size.  The minimum and maximum
> constraints are ignored for now.
> 
> The names of the kernel hints are very confusing, and do not refer to
> the "minimum" of anything, see this document for an explanation:
> https://people.redhat.com/msnitzer/docs/io-limits.txt

...

> @@ -529,6 +532,28 @@ void parse_sizes(char *buf, uint64_t *size, uint16_t *flags) {
>  	printf("\n");
>  }
>  
> +/* Parse reply from NBD_INFO_BLOCK_SIZE */
> +void parse_block_sizes(char *data, uint32_t datasize, uint32_t *block_sizes)
> +{
> +	if (datasize < 3 * sizeof(uint32_t)) {
> +		err("E: server sent too short reply to NBD_INFO_BLOCK_SIZE, ignoring");
> +		return;
> +	}
> +	memcpy(&block_sizes[0], &data[0], sizeof(uint32_t));
> +	block_sizes[0] = ntohl(block_sizes[0]);
> +	memcpy(&block_sizes[1], &data[4], sizeof(uint32_t));
> +	block_sizes[1] = ntohl(block_sizes[1]);
> +	memcpy(&block_sizes[2], &data[8], sizeof(uint32_t));
> +	block_sizes[2] = ntohl(block_sizes[2]);

Is it worth doing data validation that the numbers the server sent us make sense?

> +
> +#if 0
> +	printf("server block sizes: min: %ld, pref: %ld, max: %ld\n",
> +	       (long) block_sizes[0],
> +	       (long) block_sizes[1],
> +	       (long) block_sizes[2]);
> +#endif

While this was obviously useful during testing, do we need the #if 0
in the final patch?

> @@ -682,7 +709,12 @@ void negotiate(int *sockp, u64 *rsize64, uint16_t *flags, char* name, uint32_t n
>  		return;
>  	}
>  
> -	send_info_request(sock, NBD_OPT_GO, 0, NULL, name);
> +	block_sizes[0] = 1; /* default minimum */
> +	block_sizes[1] = 4096; /* default preferred */
> +	block_sizes[2] = 0xffffffff; /* default maximum */

Should we instead default to 512 as the minimum (assume that the
server can't gracefully handle sub-sector requests unless it
explicitly tells us), and 32M as the maximum (assume that the server
will likely disconnect if we exceed its buffers, where 32M is the
maximally-portable buffer size that older servers supported before
newer servers could advertise larger buffers)?

Overall, I think the strategy makes sense.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


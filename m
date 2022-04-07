Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA814F88B7
	for <lists+nbd@lfdr.de>; Thu,  7 Apr 2022 22:54:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B4D86204CE; Thu,  7 Apr 2022 20:54:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr  7 20:54:54 2022
Old-Return-Path: <v.sementsov-og@mail.ru>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,NICE_REPLY_A,PHONENUMBER,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L5,
	SARE_FREE_WEBM_RuMail,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AC9F8204A9
	for <lists-other-nbd@bendel.debian.org>; Thu,  7 Apr 2022 20:54:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.917 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, PHONENUMBER=1.5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L5=0.001,
	SARE_FREE_WEBM_RuMail=0.671, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id S-wVRrAwzjVB for <lists-other-nbd@bendel.debian.org>;
	Thu,  7 Apr 2022 20:54:41 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 1016 seconds by postgrey-1.36 at bendel; Thu, 07 Apr 2022 20:54:41 UTC
Received: from fallback18.mail.ru (fallback18.mail.ru [185.5.136.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 87B3A20499
	for <nbd@other.debian.org>; Thu,  7 Apr 2022 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=HfiIvPK3Z+v+NJn5vUuVxlpVSird5bMp2jx3KNNcj1U=;
	t=1649364881;x=1649970281; 
	b=F6vxHZv/50Lkv+YpTx60hD9FzhAnZMKOEbrcbKa8QhyydqJ1EFPKkrj7nU1oTryTHgOtGoLE09o/Mm/YrnLqbrDlBw5CI6obvDX2kgdkf6NCRnbFPQoICgLJpPFAsus6AkYV0XpUYF82FjMIS1N4zSLISi8aWdf276nokhm6IZc=;
Received: from [10.161.64.55] (port=43150 helo=smtp47.i.mail.ru)
	by fallback18.m.smailru.net with esmtp (envelope-from <v.sementsov-og@mail.ru>)
	id 1ncYsw-0001Rd-Cn; Thu, 07 Apr 2022 23:37:42 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=HfiIvPK3Z+v+NJn5vUuVxlpVSird5bMp2jx3KNNcj1U=;
	t=1649363862;x=1649969262; 
	b=GJZ7PhC55enovI6Edyi2S2TESjjwp/ynGEFyIXKLlMN3GdsIFCI8BQ9BLZq4FutpNfVk/nGE/Btr8Aw/vPasCPz8SO0rFgLA8/emd4sLOzp9jG46g9Sml2lHSjKHqCd6qhmJx3mPc92euCdmEzvida9/dak8MbILOcwjdY+Ytu3MUbHXQZ9Nd5llARt0iwh6auLAIYbDk19bqR3w/6xQNJ5+tcoTD9rV02DJ7rGFcC7o9fKLeplZN/NCUgiPNWEKOSTj3jes2EOEfqpNm6GzLm9Uy31N4wCwVDNd4xDJl9TAFbHKteqVPZF7tL9jIk2qi18HLtKozRK3ZZTVakt8zg==;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from <v.sementsov-og@mail.ru>)
	id 1ncYsm-0008J9-5c; Thu, 07 Apr 2022 23:37:32 +0300
Message-ID: <5de5ca1b-e68f-1a09-77e4-3083aa0e31d4@mail.ru>
Date: Thu, 7 Apr 2022 23:37:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] spec: Clarify BLOCK_STATUS reply details
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, rjones@redhat.com
References: <20220401210807.1515492-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220401210807.1515492-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B63E071AA8307CB889E09FEE874B0378E68B8BE5201B9DF8182A05F5380850403C3A73193B0B6DCF33EEA9C4A31BC07D94E8E19132C615F368E0920A1D2206DC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7811C3E343B302E2EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377A7A7D315BEE81B48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80E5580D97763BB251399F08DFC82A07C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE749E2213E709ACCBA9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18F04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3733B5EC72352B9FA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCEE7C60020D8CE5D63AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006372EAFB35C18708B4CD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F443EE40786112381CE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A523AAF95F5F60D63BB9594752FC13FDB5BBAA21E77A939500D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3463DBE2ADA183F62F0C826066E70D95F10692CE0C198B36C410496C578BE14E2BCC4595B520C309F61D7E09C32AA3244C6EFE960341229D4D68102277D125EE7CA8CE788DE683120583B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzDs61/8Pi1EmesF/jBhmDQ==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913D56CB75C29E46849AEA54C202DC5BC46E8D8DB98B0C098CBE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4D699CF5C96332D13F8B6A21999C6E048E622797FBD686638049FFFDB7839CE9E78D84D2768DEDFD6BAE6EF147E6959F62BA414C4F13980BCA48A0F79A1C540C0
X-7FA49CB5: 0D63561A33F958A5676D876EFF0CF13BC4F8F3B1D24A4B9CDCB89EFF974587A8CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F79006371FEB031537767747389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8A6C7FFFE744CA7FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C5DA91C8160F4BAA0AD7EC71F1DB884274AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B611AFCC00CCEBBA58089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5676D876EFF0CF13BC4F8F3B1D24A4B9C6DA0C57B7EE6BD89D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzDs61/8Pi1FicsDZi+c9wg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hwBtHsi4ZhB.A.7EE.e-0TiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1918
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5de5ca1b-e68f-1a09-77e4-3083aa0e31d4@mail.ru
Resent-Date: Thu,  7 Apr 2022 20:54:54 +0000 (UTC)

02.04.2022 00:08, Eric Blake wrote:
> Our docs were inconsistent on whether a NBD_REPLY_TYPE_BLOCK_STATUS
> reply chunk can exceed the client's requested length, and silent on
> whether the lengths must be consistent when multiple contexts were
> negotiated.  Clarify this to match existing practice as implemented in
> qemu-nbd. 

I think by existing practice you mean only the latter?

Seems that currently we never report more information than requested on BLOCK_STATUS.

hope that there no existing too strict clients that supports BLOCK_STATUS without REQ_ONE and check each extent to be less than original request length (accordingly to old spec):)
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

> Clean up some nearby grammatical errors while at it.
> ---
> 
> Another round of rewording attempts, based on feedback from Rich on
> v2.  I went ahead and pushed patch 1 and 2 of the v2 series, as they
> were less controversial.
> 
>   doc/proto.md | 42 ++++++++++++++++++++++++++++--------------
>   1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 8a817d2..bacccfa 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -882,15 +882,25 @@ The procedure works as follows:
>     server supports.
>   - During transmission, a client can then indicate interest in metadata
>     for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
> -  where *offset* and *length* indicate the area of interest. The
> -  server MUST then respond with the requested information, for all
> -  contexts which were selected during negotiation. For every metadata
> -  context, the server sends one set of extent chunks, where the sizes
> -  of the extents MUST be less than or equal to the length as specified
> -  in the request. Each extent comes with a *flags* field, the
> -  semantics of which are defined by the metadata context.
> -- A server MUST reply to `NBD_CMD_BLOCK_STATUS` with a structured
> -  reply of type `NBD_REPLY_TYPE_BLOCK_STATUS`.
> +  where *offset* and *length* indicate the area of interest. On
> +  success, the server MUST respond with one structured reply chunk of
> +  type `NBD_REPLY_TYPE_BLOCK_STATUS` per metadata context selected
> +  during negotiation, where each reply chunk is a list of one or more
> +  consecutive extents for that context.  Each extent comes with a
> +  *flags* field, the semantics of which are defined by the metadata
> +  context.
> +
> +The client's requested *length* is only a hint to the server, so the
> +cumulative extent length contained in a chunk of the server's reply
> +may be shorter or longer the original request.  When more than one
> +metadata context was negotiated, the reply chunks for the different
> +contexts of a single block status request need not have the same
> +number of extents or cumulative extent length.
> +
> +In the request, the client may use the `NBD_CMD_FLAG_REQ_ONE` command
> +flag to further constrain the server's reply so that each chunk
> +contains exactly one extent whose length does not exceed the client's
> +original *length*.
> 
>   A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
>   nonzero number of metadata contexts during negotiation, and used the
> @@ -1778,8 +1788,8 @@ MUST initiate a hard disconnect.
>     *length* MUST be 4 + (a positive integer multiple of 8).  This reply
>     represents a series of consecutive block descriptors where the sum
>     of the length fields within the descriptors is subject to further
> -  constraints documented below. This chunk type MUST appear
> -  exactly once per metadata ID in a structured reply.
> +  constraints documented below.  A successful block status request MUST
> +  have exactly one status chunk per negotiated metadata context ID.
> 
>     The payload starts with:
> 
> @@ -1801,15 +1811,19 @@ MUST initiate a hard disconnect.
>     *length* of the final extent MAY result in a sum larger than the
>     original requested length, if the server has that information anyway
>     as a side effect of reporting the status of the requested region.
> +  When multiple metadata contexts are negotiated, the reply chunks for
> +  the different contexts need not have the same number of extents or
> +  cumulative extent length.
> 
>     Even if the client did not use the `NBD_CMD_FLAG_REQ_ONE` flag in
>     its request, the server MAY return fewer descriptors in the reply
>     than would be required to fully specify the whole range of requested
>     information to the client, if looking up the information would be
>     too resource-intensive for the server, so long as at least one
> -  extent is returned. Servers should however be aware that most
> -  clients implementations will then simply ask for the next extent
> -  instead.
> +  extent is returned.  Servers should however be aware that most
> +  client implementations will likely follow up with a request for
> +  extent information at the first offset not covered by a
> +  reduced-length reply.
> 
>   All error chunk types have bit 15 set, and begin with the same
>   *error*, *message length*, and optional *message* fields as


-- 
Best regards,
Vladimir

